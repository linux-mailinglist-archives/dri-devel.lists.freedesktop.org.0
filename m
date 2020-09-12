Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CF2676E3
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 02:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C316E13D;
	Sat, 12 Sep 2020 00:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94426E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 00:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBfeFRQ1KZUYd+L8bo2jzsK+AUh9kr7BMGq5v//v/Hx+jHioWg7Ym7NDZZnkz78n5JySyWYP8olkA0fLNdPZfIYQaXpW8rroEmsQ9rjZXKt1Nkyc11xYzRQ0RgdARZ90uwFjC02GxJi8K8jiNM4hyj3w+drqRQwwzfv89d6+1zYWVt73WzF73JywqdOrg39X/iQxaEAmi3++lNDbk0vECVBk4hM8d4/E/uJuFc8+lslM8HevdglCE/pvSA+VuZPzLYk+SV9kCR5l9AtcUxA4sv1+dJzs0zqqPJS7BRcl/En2eW/oJxHzjRV/XAXzmPOjHznoguxz4T2buxQw4tfUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E6dZcpzmvkIRclN2O8w1l45AIh9cWmgFsfAkoCwb34=;
 b=i1WBzuQgve+JeIagAkzy17amD7IvbyR58ntGAHKHXSLwQQaSRTZdpp/kop4L16Mq35spfEPYsTSftN3MPz93v70ajASomxEjgRoLVD5hoEdVfkylrmA7t1FFSI2ZDEpVpcIk19vX8itOjC1iTarwhRgMy0Wpn/+kl6BiEItTE12MN0k1xHU8C3ky7Tqe7WSX1ONM6k9x5KyIxxGS90wP6CbCVBlHLNea5jRj5O66Vnw3wJYSWpemY5z3WklGeNPXPv5ztU1iXmz1p9rAVkIkIEdb3GT0Z5BL91swGYGdYaaXndpjp90eMy9YDKqngArJzauYTg6j2WmGr/AjGSEpQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E6dZcpzmvkIRclN2O8w1l45AIh9cWmgFsfAkoCwb34=;
 b=GHb7656eXm+cscLLMsOcOc+xuBCv9oxkDEZVc4ueS/VhX+8UNBAlmfwC78a5/9JowGJ531OL8/MLJpiDmlU1WVcGxBIcYEpuSunqy9DiyVC9rLGBYhxqmSw7Y3lSDykfrHC/Xer6KmsBwsC1dT4zuA/hEUTvYy9f5SY4k7qQNHo=
Received: from MN2PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:c0::39)
 by BY5PR02MB6641.namprd02.prod.outlook.com (2603:10b6:a03:200::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Sat, 12 Sep
 2020 00:45:26 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:c0:cafe::9) by MN2PR05CA0026.outlook.office365.com
 (2603:10b6:208:c0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.6 via Frontend
 Transport; Sat, 12 Sep 2020 00:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Sat, 12 Sep 2020 00:45:25
 +0000
Received: from [149.199.38.66] (port=45848 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGtfP-0000rk-Hp; Fri, 11 Sep 2020 17:45:23 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGtfQ-0006LC-Ot; Fri, 11 Sep 2020 17:45:24 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08C0jGPX005819; 
 Fri, 11 Sep 2020 17:45:17 -0700
Received: from [172.19.75.82] (helo=xsjsycl40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGtfI-0006FZ-TI; Fri, 11 Sep 2020 17:45:16 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id D6F3B352C02; Fri, 11 Sep 2020 17:45:16 -0700 (PDT)
Date: Fri, 11 Sep 2020 17:45:16 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: xlnx: remove defined but not used
 'scaling_factors_666'
Message-ID: <20200912004516.GA3814876@xilinx.com>
References: <20200910140630.1191782-1-yanaijie@huawei.com>
 <20200910181418.GA3187626@xilinx.com>
 <20200911081519.GM438822@phenom.ffwll.local>
 <20200911162708.GA3715173@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911162708.GA3715173@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8f19fd4-e733-43b7-45eb-08d856b5231d
X-MS-TrafficTypeDiagnostic: BY5PR02MB6641:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6641BB4319C42B9A66C29B9BD6250@BY5PR02MB6641.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdZ+J8D6HmQAoiOI5lTbP+ww1Dy278hy+RnwCFxbE2J3qxDpmG040e0JwAwu/l8NDWwgKT98gpTmtZPQCHc6KJ0MeoUJiUMPT/8M3gWbqpHCRrqYqSfWcrmNQdeGRvjaSuDy/aB2h1YLpDPFRSkwHWNwWU1v6aHmCZgf6huTqyHLP6KFmnVmxwp0O4flZ43sGrAvXAnyuOa7zL09TLkMxaP9KyfQxCtkIhl+nGar6rHuVviHeV2otlQO20vdNWVXnCcIvxnAAl89P4Y1gjMrmx8yKKEyUyx8Tx+T7dY1vS0TX8VxgHCJP2nr2ruogBsdjBNVlB6D5wVpfaivoevLDNUkX5ET9NfMdMmeg4zbly7Vrnf0N6R/QuRhOHViVl7r11HnR7keyKuXuGRBQuUBkiwZP6gFAouEJSdo+rHXfwmefPb3SAXbpZZPA5iIJt89sKSP3MFYsaWgGBj0gYQyAelTa8FxNorxnIX0JSCrZW4=
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(346002)(396003)(46966005)(8676002)(47076004)(6266002)(33656002)(44832011)(8936002)(4326008)(2906002)(336012)(966005)(316002)(478600001)(1076003)(6916009)(426003)(54906003)(70206006)(2616005)(82310400003)(83380400001)(26005)(356005)(42186006)(70586007)(82740400003)(83080400001)(5660300002)(186003)(36756003)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2020 00:45:25.1005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f19fd4-e733-43b7-45eb-08d856b5231d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6641
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
Cc: Jason Yan <yanaijie@huawei.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTEsIDIwMjAgYXQgMDk6Mjc6MDhBTSAtMDcwMCwgSHl1biBLd29uIHdyb3Rl
Ogo+IEhpIERhbmllbCwKPiAKPiBPbiBGcmksIFNlcCAxMSwgMjAyMCBhdCAwMToxNToxOUFNIC0w
NzAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMTE6
MTQ6MThBTSAtMDcwMCwgSHl1biBLd29uIHdyb3RlOgo+ID4gPiBIaSBKYXNvbiwKPiA+ID4gCj4g
PiA+IE9uIFRodSwgU2VwIDEwLCAyMDIwIGF0IDA3OjA2OjMwQU0gLTA3MDAsIEphc29uIFlhbiB3
cm90ZToKPiA+ID4gPiBUaGlzIGFkZHJlc3NlcyB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nIHdp
dGggIm1ha2UgVz0xIjoKPiA+ID4gPiAKPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5x
bXBfZGlzcC5jOjI0NToxODogd2FybmluZzoKPiA+ID4gPiDigJhzY2FsaW5nX2ZhY3RvcnNfNjY2
4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gPiA+
ID4gICAyNDUgfCBzdGF0aWMgY29uc3QgdTMyIHNjYWxpbmdfZmFjdG9yc182NjZbXSA9IHsKPiA+
ID4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gPiA+
IAo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4gPiA+
IAo+ID4gPiBSZXZpZXdlZC1ieTogSHl1biBLd29uIDxoeXVuLmt3b25AeGlsaW54LmNvbT4KPiA+
IAo+ID4gSSB0aGluayB5b3UncmUgdGhlIG1haW50YWluZXIsIHNvIHBsZWFzZSBhbHNvIHB1c2gg
cGF0Y2hlcyB0bwo+ID4gZHJtLW1pc2MtbmV4dC4gT3RoZXJ3aXNlIHRoZXknbGwganVzdCBnZXQg
bG9zdCwgb3IgYXQgbGVhc3QgaXQncyB2ZXJ5Cj4gPiBjb25mdXNpbmcgd2hlbiBhIG1haW50YWlu
ZXIgcmV2aWV3cyBhIHBhdGNoIGJ1dCB0aGVyZSdzIG5vIGluZGljYXRpb24gd2hhdAo+ID4gd2ls
bCBoYXBwZW4gd2l0aCB0aGUgcGF0Y2guCj4gCj4gUmlnaHQuIEkgd2FudGVkIHRvIGdpdmUgaXQg
c29tZSB0aW1lIGJlZm9yZSBwdXNoaW5nLiBJJ2xsIGNsZWFybHkgc3RhdGUgZ29pbmcKPiBmb3J3
YXJkLgo+IAoKUHVzaGVkIHRvIGRybS1taXNjL2RybS1taXNjLW5leHQuCgpUaGFua3MsCi1oeXVu
Cgo+IFRoYW5rcywKPiAtaHl1bgo+IAo+ID4gLURhbmllbAo+ID4gCj4gPiA+IAo+ID4gPiBUaGFu
a3MhCj4gPiA+IAo+ID4gPiAtaHl1bgo+ID4gPiAKPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYyB8IDYgLS0tLS0tCj4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlu
cW1wX2Rpc3AuYwo+ID4gPiA+IGluZGV4IGE0NTVjZmMxYmVlNS4uOThiZDQ4ZjEzZmQxIDEwMDY0
NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMKPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jCj4gPiA+ID4gQEAgLTI0
MiwxMiArMjQyLDYgQEAgc3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNfNTY1W10gPSB7
Cj4gPiA+ID4gIAlaWU5RTVBfRElTUF9BVl9CVUZfNUJJVF9TRiwKPiA+ID4gPiAgfTsKPiA+ID4g
PiAgCj4gPiA+ID4gLXN0YXRpYyBjb25zdCB1MzIgc2NhbGluZ19mYWN0b3JzXzY2NltdID0gewo+
ID4gPiA+IC0JWllOUU1QX0RJU1BfQVZfQlVGXzZCSVRfU0YsCj4gPiA+ID4gLQlaWU5RTVBfRElT
UF9BVl9CVUZfNkJJVF9TRiwKPiA+ID4gPiAtCVpZTlFNUF9ESVNQX0FWX0JVRl82QklUX1NGLAo+
ID4gPiA+IC19Owo+ID4gPiA+IC0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2Zh
Y3RvcnNfODg4W10gPSB7Cj4gPiA+ID4gIAlaWU5RTVBfRElTUF9BVl9CVUZfOEJJVF9TRiwKPiA+
ID4gPiAgCVpZTlFNUF9ESVNQX0FWX0JVRl84QklUX1NGLAo+ID4gPiA+IC0tIAo+ID4gPiA+IDIu
MjUuNAo+ID4gPiA+IAo+ID4gCj4gPiAtLSAKPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
