Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D610012829
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5093A8961E;
	Fri,  3 May 2019 06:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710128.outbound.protection.outlook.com [40.107.71.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50309897D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:15:18 +0000 (UTC)
Received: from DM5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:3:23::33) by
 DM5PR13MB1402.namprd13.prod.outlook.com (2603:10b6:3:124::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.9; Thu, 2 May 2019 18:15:13 +0000
Received: from CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::207) by DM5PR13CA0023.outlook.office365.com
 (2603:10b6:3:23::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.6 via Frontend
 Transport; Thu, 2 May 2019 18:15:13 +0000
Received-SPF: PermError (protection.outlook.com: domain of sony.com used an
 invalid SPF mechanism)
Received: from usculsndmail02v.am.sony.com (160.33.194.229) by
 CY1NAM02FT045.mail.protection.outlook.com (10.152.75.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 2 May 2019 18:15:10 +0000
Received: from usculsndmail12v.am.sony.com (usculsndmail12v.am.sony.com
 [146.215.230.103])
 by usculsndmail02v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
 ESMTP id x42IF8nt010260; Thu, 2 May 2019 18:15:08 GMT
Received: from USCULXHUB07V.am.sony.com (usculxhub07v.am.sony.com
 [146.215.231.168])
 by usculsndmail12v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
 ESMTP id x42IF6Jm028842; Thu, 2 May 2019 18:15:06 GMT
Received: from USCULXMSG01.am.sony.com ([fe80::b09d:6cb6:665e:d1b5]) by
 USCULXHUB07V.am.sony.com ([146.215.231.168]) with mapi id 14.03.0439.000;
 Thu, 2 May 2019 14:15:06 -0400
From: <Tim.Bird@sony.com>
To: <gregkh@linuxfoundation.org>, <brendanhiggins@google.com>
Subject: RE: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Thread-Topic: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Thread-Index: AQHVAHJbh4bzAud+AEekHmLRH8eTgKZX75eAgAA1NbA=
Date: Thu, 2 May 2019 18:14:53 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
 <20190502110347.GE12416@kroah.com>
In-Reply-To: <20190502110347.GE12416@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.215.228.6]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:160.33.194.229; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(1496009)(376002)(136003)(396003)(39860400002)(346002)(2980300002)(448002)(199004)(189003)(13464003)(72206003)(478600001)(47776003)(46406003)(37786003)(33656002)(97756001)(86362001)(70206006)(5660300002)(70586007)(356004)(6666004)(102836004)(186003)(426003)(11346002)(446003)(336012)(26005)(476003)(66066001)(55016002)(76176011)(7696005)(229853002)(8676002)(126002)(55846006)(85326001)(246002)(86152003)(8746002)(8936002)(486006)(50466002)(6246003)(7406005)(7416002)(4326008)(6116002)(3846002)(2906002)(110136005)(54906003)(2876002)(316002)(7736002)(305945005)(23726003)(5001870100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR13MB1402; H:usculsndmail02v.am.sony.com;
 FPR:; SPF:PermError; LANG:en; PTR:mail.sonyusa.com,mail02.sonyusa.com; A:1;
 MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2927ae1-d49f-4bad-60b8-08d6cf2a1ea6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:DM5PR13MB1402; 
X-MS-TrafficTypeDiagnostic: DM5PR13MB1402:
X-Microsoft-Antispam-PRVS: <DM5PR13MB140230E0A68E41CAF530C442FD340@DM5PR13MB1402.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0025434D2D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bU7dXAdMkBInmgFf3lbIAW/yrfjtPBT7xmHmRhPy+u/F81wqySYLneMKTgJ9uy6f0YnZlYzBIkUsJAFTKMvemgB8r0n8PpNut2dmxJyH0Tk3YniGZd66ERVNzNrefJVodv/kWUa6hgaki3mMtJp344RiOE+WDa1J6M1g8Xj9npIFmFbrKiNIqwy1kXQ1Nos1+jmUPPhdwmrCrUM652L4NDdpkYmrbJHGyo9Ki1uRlPub4F9xawbOv81NFQPbIr5jHTyV64qs0ySjS1hcXMVutCtRZYsHhbYXhA/h75upZypux1FfLor+rwCD2yUnL3L99DmemLALTzZurd+QM2IHPlRwBxUAIqwKyaM/GkcGTDxtfN/V3xavfSUHvudrqzxUZr4qoNFcRzjn8zuSDnhx4cCFFWZq6LryN47KBRJZgiU=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2019 18:15:10.9314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2927ae1-d49f-4bad-60b8-08d6cf2a1ea6
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4; Ip=[160.33.194.229];
 Helo=[usculsndmail02v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1402
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sony.onmicrosoft.com; 
 s=selector1-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu+qU7j1g4e0qKYY8NI+jYs8IDMeXiI9rKB2912aQxk=;
 b=RUlxFd43z0o0UbNfcJc6XxkFUNZRjbE6rDjHopszHC++6umPBCdj0bHYmEu7/iA8OAlvWwEHPLv4Yg1CRE6zRz/uncBnYwU/smDnizFcPa8KTi/iq744WUooeJBhZ48XuxmeUwYKfjzNGNs1IeBdyoq+75fOWCNe+LpZq2kMfXQ=
X-Mailman-Original-Authentication-Results: spf=permerror (sender IP is
 160.33.194.229)
 smtp.mailfrom=sony.com; linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=sony.com;
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, yzaikin@google.com, khilman@baylibre.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, jdike@addtoit.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogR3JlZyBLSCAKPiAKPiBPbiBX
ZWQsIE1heSAwMSwgMjAxOSBhdCAwNDowMToyNVBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3Jv
dGU6Cj4gPiBGcm9tOiBJdXJpaSBaYWlraW4gPHl6YWlraW5AZ29vZ2xlLmNvbT4KPiA+Cj4gPiBL
VW5pdCB0ZXN0cyBmb3IgaW5pdGlhbGl6ZWQgZGF0YSBiZWhhdmlvciBvZiBwcm9jX2RvaW50dmVj
IHRoYXQgaXMKPiA+IGV4cGxpY2l0bHkgY2hlY2tlZCBpbiB0aGUgY29kZS4gSW5jbHVkZXMgYmFz
aWMgcGFyc2luZyB0ZXN0cyBpbmNsdWRpbmcKPiA+IGludCBtaW4vbWF4IG92ZXJmbG93Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29t
Pgo+ID4gLS0tCj4gPiAga2VybmVsL01ha2VmaWxlICAgICAgfCAgIDIgKwo+ID4gIGtlcm5lbC9z
eXNjdGwtdGVzdC5jIHwgMjkyCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gIGxpYi9LY29uZmlnLmRlYnVnICAgIHwgICA2ICsKPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDMwMCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9z
eXNjdGwtdGVzdC5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9NYWtlZmlsZSBiL2tlcm5l
bC9NYWtlZmlsZQo+ID4gaW5kZXggNmM1N2U3ODgxN2RhZC4uYzgxYTg5NzZiNmE0YiAxMDA2NDQK
PiA+IC0tLSBhL2tlcm5lbC9NYWtlZmlsZQo+ID4gKysrIGIva2VybmVsL01ha2VmaWxlCj4gPiBA
QCAtMTEyLDYgKzExMiw4IEBAIG9iai0kKENPTkZJR19IQVNfSU9NRU0pICs9IGlvbWVtLm8KPiA+
ICBvYmotJChDT05GSUdfWk9ORV9ERVZJQ0UpICs9IG1lbXJlbWFwLm8KPiA+ICBvYmotJChDT05G
SUdfUlNFUSkgKz0gcnNlcS5vCj4gPgo+ID4gK29iai0kKENPTkZJR19TWVNDVExfS1VOSVRfVEVT
VCkgKz0gc3lzY3RsLXRlc3Qubwo+IAo+IFlvdSBhcmUgZ29pbmcgdG8gaGF2ZSB0byBoYXZlIGEg
InN0YW5kYXJkIiBuYW1pbmcgc2NoZW1lIGZvciB0ZXN0Cj4gbW9kdWxlcywgYXJlIHlvdSBnb2lu
ZyB0byByZWNvbW1lbmQgImZvby10ZXN0IiBvdmVyICJ0ZXN0LWZvbyI/ICBJZiBzbywKPiB0aGF0
J3MgZmluZSwgd2Ugc2hvdWxkIGp1c3QgYmUgY29uc2lzdGFudCBhbmQgZG9jdW1lbnQgaXQgc29t
ZXdoZXJlLgo+IAo+IFBlcnNvbmFsbHksIEknZCBwcmVmZXIgInRlc3QtZm9vIiwgYnV0IHRoYXQn
cyBqdXN0IG1lLCBuYW1pbmcgaXMgaGFyZC4uLgoKTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSAidGVz
dC1mb28iIGFzIHdlbGwuICBKdXN0IG15IDIgY2VudHMuCiAtLSBUaW0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
