Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0531BD4D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816F96EC9E;
	Wed, 29 Apr 2020 06:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2067.outbound.protection.outlook.com [40.92.20.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E269A6E9DB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 21:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPx7g9ao5an1V3FvVMpMRbg0SI7mbUxSLYUuZKO6DBmmEKCdlIkkZOzl2WOSCs++1QdJ5EI6E14f9GkiGlQ8XIR8kBBc3wF/QpHSQ6sC1bg6ZGdE4cBQvtR481JYSNL1J25A7GSzA5OcjshtSd/2BjONqSxvwgyu7x0s2sPdP27c32vX3gPVzVSUjrnwJnfeYSE7xU79vnn/zWVYoNUTzVuLC8seon9ktI9dKPhqCbYJA3oc+GxzC6GAXdYMYQo/c/Qt9/qjuZdeaYUXFwFgk0H7uqPs1+gVnr+DdlsXGtZupk5UwqRPeUvQGzFqORfLyOpJqmJ+n93wKt107ms9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt+11Ldtf3glce+SciMw/wPMLwOlV8OmZlM/x7y8ADs=;
 b=jZEBnxT0vTa0dvROqUXqsmKYQbcFKCd2vx0lBPxIcyQpbpnaF/ris1AHlFh4nrv1XaYjpFDk1Q3AsppTmCn0kTD/FycEeXH/AZARmKdHiBPjxl4PbH8soDcmAzioazND+g7W8CBEU7Rs4C1G34XpzzPKiyTRZM4Qu3Q/WcHW++0HPaRSlszKFXQ3KLDn5vi1VHkInkm8NvQWLPvOM2j3gBcJkQ6WuYgoMI6HmovurXEAA+m6miVdN2u3yysL9/wax981495950VUN9tLEDr62ajTEQes65dqcn8cuPqRmWuYOwPWbjN7DC4HPXMdeuMA0tx5tzPz45HmcmqYhGrouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::46) by
 DM6NAM11HT249.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Tue, 28 Apr
 2020 21:39:20 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::4e) by DM6NAM11FT033.mail.protection.outlook.com
 (2a01:111:e400:fc4d::221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Tue, 28 Apr 2020 21:39:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:28F5F02185C5E04051ED80926CB782C29EE4DB171420ABC2B053968DABB39086;
 UpperCasedChecksum:279D0200178AC5B999032F9459168FADA96122720AA5FE5D30D8AA4363ACA612;
 SizeAsReceived:10027; Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 21:39:20 +0000
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
 <NYBE9Q.YH08US7A7DC3@crapouillou.net>
 <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200427154617.GA1798@pi3>
From: Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date: Tue, 28 Apr 2020 14:39:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200427154617.GA1798@pi3>
Content-Language: en-US
X-ClientProxiedBy: MWHPR20CA0038.namprd20.prod.outlook.com
 (2603:10b6:300:ed::24) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <7bf2cb45-d9a1-7c3f-9efc-8dd0e8d7939a@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb67:7300:9f89:4b96:de0b:cd14]
 (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by
 MWHPR20CA0038.namprd20.prod.outlook.com (2603:10b6:300:ed::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Tue, 28 Apr 2020 21:39:17 +0000
X-Microsoft-Original-Message-ID: <7bf2cb45-d9a1-7c3f-9efc-8dd0e8d7939a@live.ca>
X-TMN: [XQ4bYy16QTd757uucX8/ZshxJB4VRIHnZHfMejwEPlAMFVFR72l3yAYYxtSchIi7]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dabcd893-72f5-4de7-f4ef-08d7ebbc9be1
X-MS-TrafficTypeDiagnostic: DM6NAM11HT249:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8kNBP7qn0kIsRMXv3mgH2CWAkzQVGL1asywzAwJmrIt7xgR7xunct+WroNd3uT34UTfSFySXiN3LP6DWyfoDC//QlNMs+Iy0J9E+/xPlgCm+LWm/jx9nW+OrxPJdXPzPrb+Rp7jQF+0BAAM97mCzrodYt2VrLKYOqCKZZpg0hMvimvN1JGdV+ZnIm7g5DSLMN2KRU5ZSw9+KaBNIpnLu3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0660.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: 5X16aCAa4cWHX0E0zbWBl0Xt+Xq1kyp0gZPcIQV3xtpSF5JqYgEfymJM1Bg2C4Az+tQYt1BT38WYBan9AeZQ+iWh0rfSPGeb10MipmTV14n5HIDqvPJQd7TUNR656DNWP0syTJ2elTIRCXFbG2oVkjaAW83Gp1jZE17IghT1uEVsCAA0jejdW3AyHJnHpM4/MMVG7O56z+1/bz/yHIJlWg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabcd893-72f5-4de7-f4ef-08d7ebbc9be1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 21:39:20.3378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT249
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 James Hogan <jhogan@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLAoKT24gMjAyMC0wNC0yNyA4OjQ2IGEubS4sIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gT24gU3VuLCBBcHIgMjYsIDIwMjAgYXQgMDc6NTc6MTJBTSAtMDcwMCwgSm9u
YXRoYW4gQmFra2VyIHdyb3RlOgo+PiBIaSBQYXVsLAo+Pgo+PiBPbiAyMDIwLTA0LTI2IDU6NTYg
YS5tLiwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gTGUgdmVuLiAyNCBhdnJpbCAy
MDIwIMOgIDIyOjM0LCBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IGEg
w6ljcml0IDoKPj4+PiBGcm9tOiBKb25hdGhhbiBCYWtrZXIgPHhjLXJhY2VyMkBsaXZlLmNhPgo+
Pj4+Cj4+Pj4gQWxsIHM1cHYyMTAgZGV2aWNlcyBoYXZlIGEgUG93ZXJWUiBTR1ggNTQwIChyZXZp
c2lvbiAxMjApIGF0dGFjaGVkLgo+Pj4+Cj4+Pj4gVGhlcmUgaXMgbm8gZXh0ZXJuYWwgcmVndWxh
dG9yIGZvciBpdCBzbyBpdCBjYW4gYmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogSm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Cj4+Pj4g
LS0tCj4+Pj4gwqBhcmNoL2FybS9ib290L2R0cy9zNXB2MjEwLmR0c2kgfCAxMyArKysrKysrKysr
KysrCj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3M1cHYyMTAuZHRzaQo+Pj4+IGluZGV4IDJhZDY0MmY1MWZkOS4uYWJiZGRhMjA1YzFiIDEw
MDY0NAo+Pj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAuZHRzaQo+Pj4+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAuZHRzaQo+Pj4+IEBAIC01MTIsNiArNTEyLDE5IEBA
IHZpYzM6IGludGVycnVwdC1jb250cm9sbGVyQGYyMzAwMDAwIHsKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4+Pj4KPj4+PiArwqDCoMKgwqDCoMKgwqAgZ3B1OiBncHVAZjMwMDAwMDAgewo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2Ftc3VuZyxzNXB2MjEwLXNneDU0
MC0xMjAiOwo+IAo+IFRoaXMgc2hvdWxkIG5vdCBwYXNzIHRoZSBiaW5kaW5ncyBjaGVjayBiZWNh
dXNlIHlvdSBtaXNzZWQgbGFzdAo+IGNvbXBhdGlibGVzLgo+IAoKVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGF0IG91dCwgSSdsbCBhZGQgaXQgYW5kIG1ha2Ugc3VyZSBpdCBwYXNzZXMgdGhlIGJpbmRp
bmdzIGNoZWNrLgoKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHhmMzAwMDAw
MCAweDEwMDAwPjsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtcGFyZW50
ID0gPCZ2aWMyPjsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPDEw
PjsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjb3JlIjsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JmNsb2NrcyBDTEtfRzNEPjsKPj4+
PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2tzID0gPCZjbG9j
a3MgTU9VVF9HM0Q+LCA8JmNsb2NrcyBET1VUX0czRD47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MD4sIDw2NjcwMDAwMD47Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xvY2tzIE1PVVRf
TVBMTD47Cj4+Pgo+Pj4gV2hhdCBhcmUgdGhlc2UgY2xvY2tzIGZvciwgYW5kIHdoeSBhcmUgdGhl
eSByZXBhcmVudGVkIC8gcmVjbG9ja2VkPwo+Pj4KPj4+IFNob3VsZG4ndCB0aGV5IGJlIHBhc3Nl
ZCB0byAnY2xvY2tzJyBhcyB3ZWxsPwo+Pj4KPj4+IC1QYXVsCj4+Pgo+Pgo+PiBUaGUgRzNEIGNs
b2NrIHN5c3RlbSBjYW4gaGF2ZSBtdWx0aXBsZSBwYXJlbnRzLCBhbmQgZm9yIHN0YWJsZSBvcGVy
YXRpb24KPj4gaXQncyByZWNvbW1lbmRlZCB0byB1c2UgdGhlIE1QTEwgY2xvY2sgYXMgdGhlIHBh
cmVudCAod2hpY2ggaW4gdHVybgo+PiBpcyBhY3R1YWxseSBhIG11eCBhcyB3ZWxsKS4gIE1PVVRf
RzNEIGlzIHNpbXBseSB0aGUgbXV4IGZvciBDTEtfRzNECj4+IChTR1ggY29yZSBjbG9jayksIERP
VVRfRzNEIGlzIHRoZSBkaXZpZGVyLiAgRE9VVF9HM0QgY291bGQgZXF1YWxseSBiZSBDTEtfRzNE
Cj4+IChhbmQgcHJvYmFibHkgc2hvdWxkIGJlLCBmb3IgcmVhZGFiaWxpdHkpIGFzIENMS19HM0Qg
aXMgc2ltcGx5IHRoZSBnYXRlIGFuZAo+PiBET1VUX0czRCBpcyB0aGUgZGl2aWRlciBmb3IgaXQu
Cj4gCj4gR29vZCBwb2ludCwgaXQgc2hvdWxkIGJlIENMS19HM0QgaW5zdGVhZCBvZiBET1VULiAg
Q2FuIHlvdSBmaXggdGhpcyBhcwo+IHdlbGw/CgpZZXAsIHdpbGwgZG8uICBOaWtvbGF1cywgSSds
bCBzZW5kIHlvdSBhbiB1cGRhdGVkIHBhdGNoIHRvIGluY2x1ZGUuCgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKPiAKClRoYW5rcywKSm9uYXRoYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
