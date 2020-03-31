Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B851219A5D2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4DC6E8ED;
	Wed,  1 Apr 2020 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBEF6E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmvYxiiDNGMzlSQL5NN9EcBUxS+l6dGCaThnfBNHGPYHE7d4IXXnmM/7GnQwKj99w7j6De1z9Rf+G7Ph/rxHb4BamV4eU7MbSXQnhwPAgr2s1VXQOCikyjjhvM4bzYAcKr2sj9hMDORvfaON+n1FvZHz44VZtwvgrTclKfKigGJo1R1nw3u8sM5O03LRHHyt5Njhpl6GODQX5ytqpXOXXap39VFgBoEv346mYGiDEzOeYdZ/Gyqj2P4LWJtDxnHQTCzsezrJ8/vRITXKT7b9oP4p1Q5QhAzttM6GAUWt+u6Md6AU/1AkxeCIOzSi3jvKFbXpln7V7Z1KiXHnA9sSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtQF7Mz3z7TAW1QpGx9kzi/8nW7DbkGdSDGP2GvAozE=;
 b=MK0TcCbd2l8Z+RjB/P3QAyBktQ2+tUJBfFTKnyF6stdOLzs4YDjMX2yJSYj0d2NylWeNZcQIqcYwcqUrncI1mLwDuGi4bQFujWdruBVvV55Qiy06SuUUfESNPs5Uv8eKmNX+AISGUB1ep/Wgbb+prfwSvJYFX+c738krWAwVy/3HyZEnGF8+iv6w7JWrZ1TBHuFF/BV38i11EVuA5VmGJ629PlYYp5B76y6dNVJ02OX8KBN0N9DGKUjgR7XnyS7gqa1JwWb/mtsdY97BEgppLrNeJnrbGdbS3UDRcb1KmX49n25zAReD1pdmVCJ/onv0Y+K2eVQdltGyEqG3xFOi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtQF7Mz3z7TAW1QpGx9kzi/8nW7DbkGdSDGP2GvAozE=;
 b=oOqHQZjjvCRVOvMZpZh/Re8Lj2UbC2hGxKZ1e43j6XKsGmm4EnGk2SSrBGzChgxwCP+/tQlTsUriV5pTF6uAAXZeJWvCvfHtSSkOWJq4MsPpBN5qFp9BWjYuNeXcTm/rf+MXm+jwi53m9OplzkE/xcwPsl3QAeIRgtiknP0/6Xw=
Received: from CY4PR13CA0036.namprd13.prod.outlook.com (2603:10b6:903:99::22)
 by CH2PR02MB6038.namprd02.prod.outlook.com (2603:10b6:610:12::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 10:05:06 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:99:cafe::1) by CY4PR13CA0036.outlook.office365.com
 (2603:10b6:903:99::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend
 Transport; Tue, 31 Mar 2020 10:05:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Tue, 31 Mar 2020 10:05:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJDlZ-0005gR-A3; Tue, 31 Mar 2020 03:05:05 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJDlU-00029P-6s; Tue, 31 Mar 2020 03:05:00 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jJDlO-000288-5q; Tue, 31 Mar 2020 03:04:54 -0700
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michal Simek <michal.simek@xilinx.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
 <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
 <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <d822c806-14c5-4ce7-b559-090b0685fa43@xilinx.com>
Date: Tue, 31 Mar 2020 12:04:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
Content-Language: en-US
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(110136005)(54906003)(336012)(316002)(70586007)(8676002)(31686004)(9786002)(356004)(6666004)(70206006)(31696002)(81156014)(44832011)(4326008)(7366002)(478600001)(82740400003)(47076004)(26005)(966005)(186003)(5660300002)(426003)(2616005)(8936002)(81166006)(36756003)(7406005)(7416002)(2906002)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c9f0f8a-afdd-4838-1385-08d7d55afcba
X-MS-TrafficTypeDiagnostic: CH2PR02MB6038:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR02MB6038CA7B9498F0DB2BBC76FDC6C80@CH2PR02MB6038.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0359162B6D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFZXih/c/iaxVYqpBg1T6IAoNBM53QthFJ2fNVYL+ka54K8bu7NotcOPqp23NtW9uSY8HpFLe+b0Ykv3F+9tN3z+Lho6Cw+Tbe0c3GhXfl+VuLfbMtO4xP4PPyOtgYdui3+bZACpVZCNHNLSS4F8eQll7SmGB1FPpzRWR/Am7BZFRW+RvNi21Fd2I1iubHJpB4GBlqEvabMY43MSj7AYz+vggTqt0IBn0yZpeeVSEG4SN9W1aZSgvxkqLR5KehAJ9TymtQihvo6I1aYk486NATd2EktkYWJ8nQdcbgmQVtA7xU0sDh0mENhGQYS5gA/jsXhYsmzooFN82Z70ZaRqnHszEfsoMBWarsiCda/m6tVhUkVPuiWYX3ShYRBzhFwvvNuANYnF0HrwrVOOr+vZwG8UN69cLFYkY7lP0xgKTIAVgwFoboyR5Bo0/CbY6Y35QqFv6VhsunOuWhcTQC8vdSfjXUpV3gXvaWeMEdGbDjynrFqVm+BNb9xFpwoqvgvdpVJCP+m9Ej/6BcBgjH4RCPCWZfSHn/8xTTF8DLLr/2arFSZFB8AkW/wQtNtq+Plyd2C07y++nOKtoHnYGoFDZyinDvSRZGYHlaal4akoSx8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 10:05:05.8101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9f0f8a-afdd-4838-1385-08d7d55afcba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6038
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
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, Leonardo Bras <leonardo@linux.ibm.com>,
 DTML <devicetree@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Enrico Weigelt <info@metux.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzEuIDAzLiAyMCAxMTo0OSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAz
MS8wMy8yMDIwIMOgIDA5OjE5LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4+Cj4+Cj4+
IExlIDMxLzAzLzIwMjAgw6AgMDg6NTksIE1pY2hhbCBTaW1layBhIMOpY3JpdMKgOgo+Pj4gT24g
MzEuIDAzLiAyMCA4OjU2LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBM
ZSAzMS8wMy8yMDIwIMOgIDA3OjMwLCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6Cj4+Pj4+
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPiB3cml0ZXM6Cj4+Pj4+
PiBMZSAyNy8wMy8yMDIwIMOgIDE1OjE0LCBBbmR5IFNoZXZjaGVua28gYSDDqWNyaXTCoDoKPj4+
Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwMjoyMjo1NVBNICswMTAwLCBBcm5kIEJlcmdt
YW5uIHdyb3RlOgo+Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAyOjE1IFBNIEFuZHkg
U2hldmNoZW5rbwo+Pj4+Pj4+PiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3
cm90ZToKPj4+Pj4+Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDAzOjEwOjI2UE0gKzAyMDAs
IEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4+Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBh
dCAwMTo1NDozM1BNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBPbiBG
cmksIE1hciAyNywgMjAyMCBhdCAxOjEyIFBNIE1pY2hhbCBTaW1lawo+Pj4+Pj4+Pj4+PiA8bWlj
aGFsLnNpbWVrQHhpbGlueC5jb20+IHdyb3RlOgo+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IEl0IGRvZXMgcmFpc2UgYSBmb2xsb3ctdXAgcXVlc3Rpb24gYWJvdXQgcHBjNDB4IHRob3Vn
aDogaXMgaXQKPj4+Pj4+Pj4+Pj4gdGltZSB0bwo+Pj4+Pj4+Pj4+PiByZXRpcmUgYWxsIG9mIGl0
Pwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gV2hvIGtub3dzPwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4g
SSBoYXZlIGluIHBvc3Nlc3Npb24gbmljZSBXRCBNeSBCb29rIExpdmUsIGJhc2VkIG9uIHRoaXMK
Pj4+Pj4+Pj4+PiBhcmNoaXRlY3R1cmUsIGFuZCBJCj4+Pj4+Pj4+Pj4gd29uJ3QgaXQgZ29uZSBm
cm9tIG1vZGVybiBrZXJuZWwgc3VwcG9ydC4gT1RPSCBJIHVuZGVyc3RhbmQgdGhhdAo+Pj4+Pj4+
Pj4+IGFtb3VudCBvZiByZWFsCj4+Pj4+Pj4+Pj4gdXNlcnMgbm90IHRvbyBiaWcuCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4gK0NjOiBDaHJpc3RpYW4gTGFtcGFydGVyLCB3aG9tIEkgb3dlIGZvciB0aGF0
IFdEIGJveC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWNjb3JkaW5nIHRvIGh0dHBzOi8vb3BlbndydC5v
cmcvdG9oL3dkL215Ym9va2xpdmUsIHRoYXQgb25lIGlzCj4+Pj4+Pj4+IGJhc2VkIG9uCj4+Pj4+
Pj4+IEFQTTgyMTgxL3BwYzQ2NCwgc28gaXQgaXMgYWJvdXQgc2V2ZXJhbCBnZW5lcmF0aW9ucyBu
ZXdlciB0aGFuCj4+Pj4+Pj4+IHdoYXQgSQo+Pj4+Pj4+PiBhc2tlZCBhYm91dCAocHBjNDB4KS4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBBaCwgYW5kIEkgaGF2ZSBBbWlnYSBib2FyZCwgYnV0IHRoYXQg
b25lIGlzIGJlaW5nIHVzZWQgb25seSBmb3IKPj4+Pj4+Pj4+PiB0ZXN0aW5nLCBzbywKPj4+Pj4+
Pj4+PiBJIGRvbid0IGNhcmUgbXVjaC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSB0aGluayB0aGVyZSBh
cmUgYSBjb3VwbGUgb2YgcHBjNDQwIGJhc2VkIEFtaWdhIGJvYXJkcywgYnV0IGFnYWluLAo+Pj4+
Pj4+PiBub3QgNDA1Cj4+Pj4+Pj4+IHRvIG15IGtub3dsZWRnZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEFo
LCB5b3UgYXJlIHJpZ2h0LiBObyBvYmplY3Rpb25zIGZyb20gcHBjNDB4IHJlbW92YWwhCj4+Pj4+
Pgo+Pj4+Pj4gUmVtb3ZpbmcgNDB4IHdvdWxkIGhlbHAgY2xlYW5pbmcgdGhpbmdzIGEgYml0LiBG
b3IgaW5zdGFuY2UgNDB4IGlzCj4+Pj4+PiB0aGUKPj4+Pj4+IGxhc3QgcGxhdGZvcm0gc3RpbGwg
aGF2aW5nIFBURV9BVE9NSUNfVVBEQVRFUy4gU28gaWYgd2UgY2FuIHJlbW92ZQo+Pj4+Pj4gNDB4
Cj4+Pj4+PiB3ZSBjYW4gZ2V0IHJpZCBvZiBQVEVfQVRPTUlDX1VQREFURVMgY29tcGxldGVseS4K
Pj4+Pj4+Cj4+Pj4+PiBJZiBubyBvbmUgb2JqZWN0cywgSSBjYW4gcHJlcGFyZSBhIHNlcmllcyB0
byBkcm9wIHN1cHBvcnQgZm9yIDQweAo+Pj4+Pj4gY29tcGxldGVseS4KPj4+Pj4+Cj4+Pj4+PiBN
aWNoYWVsLCBhbnkgdGhvdWdodCA/Cj4+Pj4+Cj4+Pj4+IEkgaGF2ZSBubyBhdHRhY2htZW50IHRv
IDQweCwgYW5kIEknZCBjZXJ0YWlubHkgYmUgaGFwcHkgdG8gaGF2ZSBsZXNzCj4+Pj4+IGNvZGUg
aW4gdGhlIHRyZWUsIHdlIHN0cnVnZ2xlIHRvIGtlZXAgZXZlbiB0aGUgbW9kZXJuIHBsYXRmb3Jt
cyB3ZWxsCj4+Pj4+IG1haW50YWluZWQuCj4+Pj4+Cj4+Pj4+IEF0IHRoZSBzYW1lIHRpbWUgSSBk
b24ndCB3YW50IHRvIHJlbmRlciBhbnlvbmUncyBoYXJkd2FyZSBvYnNvbGV0ZQo+Pj4+PiB1bm5l
Y2Vzc2FyaWx5LiBCdXQgaWYgdGhlcmUncyByZWFsbHkgbm8gb25lIHVzaW5nIDQweCB0aGVuIHdl
IHNob3VsZAo+Pj4+PiByZW1vdmUgaXQsIGl0IGNvdWxkIHdlbGwgYmUgYnJva2VuIGFscmVhZHku
Cj4+Pj4+Cj4+Pj4+IFNvIEkgZ3Vlc3MgcG9zdCBhIHNlcmllcyB0byBkbyB0aGUgcmVtb3ZhbCBh
bmQgd2UnbGwgc2VlIGlmIGFueW9uZQo+Pj4+PiBzcGVha3MgdXAuCj4+Pj4+Cj4+Pj4KPj4+PiBP
aywgc2VyaWVzIHNlbnQgb3V0LCBzZWUKPj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0xNjc3NTcKPj4+Cj4+PiBvay4gSSBz
ZWUgeW91IGhhdmUgZG9uZSBpdCBjb21wbGV0ZWx5IGluZGVwZW5kZW50bHkgb2YgbXkgcGF0Y2hz
ZXQuCj4+PiBXb3VsZCBiZSBiZXR0ZXIgaWYgeW91IGNhbiBiYXNlIGl0IG9uIHRoZSB0b3Agb2Yg
bXkgMiBwYXRjaGVzIGJlY2F1c2UKPj4+IHRoZXkgYXJlIGluIGNvbmZsaWN0IG5vdyBhbmQgSSBu
ZWVkIHRvIGFsc28gcmVtb3ZlIHZpcnRleCA0NHggcGxhdGZvcm0KPj4+IGFsc28gd2l0aCBhbHNh
IGRyaXZlci4KPj4+Cj4+Cj4+IEkgY2FuJ3Qgc2VlIHlvdXIgZmlyc3QgcGF0Y2gsIG9ubHkgdGhl
IHNlY29uZCBvbmUgc2hvd3MgdXAgaW4gdGhlCj4+IHNlcmllcywgc2VlCj4+IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTE2Nzc1
Nwo+Pgo+IAo+IAo+IE9rLCBJIGZvdW5kIHlvdXIgZmlyc3QgcGF0Y2ggb24gYW5vdGhlciBwYXRj
aHdvcmssIGl0IGRvZXNuJ3QgdG91Y2ggYW55Cj4gZmlsZSBpbiBhcmNoL3Bvd2VycGMvCgpUaGVy
ZSB3YXMganVzdCBkcml2ZXIgZGVwZW5kZW5jeSBvbiBzeW1ib2wgd2hpY2ggaXMgcmVtb3ZlZCBi
eSAyLzIuCkxldCdzIHNlZSB3aGF0IHlvdSBnZXQgZnJvbSBrYnVpbGQgaWYgYW55IHN5bWJvbCBp
cyByZW1vdmVkIGJ1dCBzdGlsbAp1c2VkIGluIGRyaXZlcnMgZm9sZGVyLgoKPiAKPiBJIHNlbnQg
YSB2MiBzZXJpZXMgd2l0aCB5b3VyIHBvd2VycGMgcGF0Y2ggYXMgcGF0Y2ggMi8xMQo+IAo+IFNl
ZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3Qv
P3Nlcmllcz0xNjc3NjYKClRoYW5rcywKTWljaGFsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
