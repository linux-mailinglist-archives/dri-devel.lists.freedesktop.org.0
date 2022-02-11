Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09A4B1F91
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9207510E9F8;
	Fri, 11 Feb 2022 07:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136010E1F5;
 Fri, 11 Feb 2022 01:28:58 +0000 (UTC)
X-UUID: a6ec2389a58f4263b294b95e622561b2-20220211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject;
 bh=WhoyAmQzNgF8EmbXvPhTH/2sxRsX1qfK5DKv6TsuUcY=; 
 b=RcedtIIcAHepwm4lfcPdHFhoFPNia8hk0NyCFSw07tJVKEq4dStrY+hni3SQolZs+hbwQ0fMdAaoJwrXEimzO/YMBiAw8ru6MZbCL+FTrL9A6EDAeaUe0Pl1wBpEjuKV2XK114rbwiA+jw97ijg9XNkhf6wluhf3xjQ5RO8fEcQ=;
X-UUID: a6ec2389a58f4263b294b95e622561b2-20220211
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1085269837; Fri, 11 Feb 2022 09:28:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Feb 2022 09:28:51 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 09:28:51 +0800
Subject: Re: [PATCH v2 4/9] PCI: mark USB4 devices as removable
To: Mario Limonciello <mario.limonciello@amd.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Andreas Noever <andreas.noever@gmail.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:X86 PLATFORM
 DRIVERS" <platform-driver-x86@vger.kernel.org>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-5-mario.limonciello@amd.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <b1b47db2-b760-649a-d0e0-79ff22ece8c0@mediatek.com>
Date: Fri, 11 Feb 2022 09:28:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220210224329.2793-5-mario.limonciello@amd.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1648681517.2033680023"
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_1648681517.2033680023
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjsyLzExLzIyJiMzMjs2OjQzJiMzMjtBTSwmIzMyO01hcmlvJiMzMjtMaW1v
bmNpZWxsbyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtVU0I0JiMzMjtjbGFzcyYjMzI7ZGV2aWNlcyYj
MzI7YXJlJiMzMjthbHNvJiMzMjtyZW1vdmFibGUmIzMyO2xpa2UmIzMyO0ludGVsJiMzMjtUaHVu
ZGVyYm9sdCYjMzI7ZGV2aWNlcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7RHJpdmVycyYjMzI7b2Ym
IzMyO2Rvd25zdHJlYW0mIzMyO2RldmljZXMmIzMyO3VzZSYjMzI7dGhpcyYjMzI7aW5mb3JtYXRp
b24mIzMyO3RvJiMzMjtkZWNsYXJlJiMzMjtmdW5jdGlvbmFsDQomZ3Q7JiMzMjtkaWZmZXJlbmNl
cyYjMzI7aW4mIzMyO2hvdyYjMzI7dGhlJiMzMjtkcml2ZXJzJiMzMjtwZXJmb3JtJiMzMjtieSYj
MzI7a25vd2luZyYjMzI7dGhhdCYjMzI7dGhleSYjMzI7YXJlJiMzMjtjb25uZWN0ZWQNCiZndDsm
IzMyO3RvJiMzMjthbiYjMzI7dXBzdHJlYW0mIzMyO1RCVC9VU0I0JiMzMjtwb3J0Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7TWFyaW8mIzMyO0xpbW9uY2llbGxvJiMz
MjsmbHQ7bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYj
MzI7JiMzMjsmIzMyO2RyaXZlcnMvcGNpL3Byb2JlLmMmIzMyO3wmIzMyOzEmIzMyOysNCiZndDsm
IzMyOyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9u
KCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvcGNp
L3Byb2JlLmMmIzMyO2IvZHJpdmVycy9wY2kvcHJvYmUuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2U0
MTY1NmNkZDhmMC4uNzM2NzNhODNlYjVlJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL3BjaS9wcm9iZS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9wY2kvcHJvYmUu
Yw0KJmd0OyYjMzI7QEAmIzMyOy0xNjEwLDYmIzMyOysxNjEwLDcmIzMyO0BAJiMzMjtzdGF0aWMm
IzMyO3ZvaWQmIzMyO3BjaV9zZXRfcmVtb3ZhYmxlKHN0cnVjdCYjMzI7cGNpX2RldiYjMzI7KmRl
dikNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyomIzMyO2V4cG9zZWQmIzMyO2FzJiMzMjsmcXVv
dDtyZW1vdmFibGUmcXVvdDsmIzMyO3RvJiMzMjt1c2Vyc3BhY2UuDQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsqLw0KJmd0OyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsodnNlYyYjMzI7fHwNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO2Rldi0mZ3Q7Y2xhc3MmIzMyOz09JiMzMjtQQ0lfQ0xB
U1NfU0VSSUFMX1VTQl9VU0I0JiMzMjt8fA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7KHBhcmVudCYjMzI7JmFtcDsmYW1wOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7KHBhcmVudC0mZ3Q7ZXh0ZXJuYWxfZmFjaW5nJiMzMjt8fCYjMzI7ZGV2
X2lzX3JlbW92YWJsZSgmYW1wO3BhcmVudC0mZ3Q7ZGV2KSkpKQ0KJmd0OyYjMzI7JiMzMjsmIzMy
O2Rldl9zZXRfcmVtb3ZhYmxlKCZhbXA7ZGV2LSZndDtkZXYsJiMzMjtERVZJQ0VfUkVNT1ZBQkxF
KTsNCiZndDsmIzMyOw0KDQpSZXZpZXdlZC1ieTomIzMyO01hY3BhdWwmIzMyO0xpbiYjMzI7Jmx0
O21hY3BhdWwubGluQG1lZGlhdGVrLmNvbSZndDsNCg0KVGhhbmtzIQ0KDQpSZWdhcmRzLA0KTWFj
cGF1bCYjMzI7TGluDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0
aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBk
ZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkg
YXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwv
cHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1648681517.2033680023
Content-Type: text/plain;
	charset="utf-8";
	format=flowed
Content-Transfer-Encoding: base64

T24gMi8xMS8yMiA2OjQzIEFNLCBNYXJpbyBMaW1vbmNpZWxsbyB3cm90ZToNCj4gVVNCNCBjbGFz
cyBkZXZpY2VzIGFyZSBhbHNvIHJlbW92YWJsZSBsaWtlIEludGVsIFRodW5kZXJib2x0IGRldmlj
ZXMuDQo+IA0KPiBEcml2ZXJzIG9mIGRvd25zdHJlYW0gZGV2aWNlcyB1c2UgdGhpcyBpbmZvcm1h
dGlvbiB0byBkZWNsYXJlIGZ1bmN0aW9uYWwNCj4gZGlmZmVyZW5jZXMgaW4gaG93IHRoZSBkcml2
ZXJzIHBlcmZvcm0gYnkga25vd2luZyB0aGF0IHRoZXkgYXJlIGNvbm5lY3RlZA0KPiB0byBhbiB1
cHN0cmVhbSBUQlQvVVNCNCBwb3J0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFyaW8gTGltb25j
aWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvcGNp
L3Byb2JlLmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wcm9iZS5jIGIvZHJpdmVycy9wY2kvcHJvYmUuYw0K
PiBpbmRleCBlNDE2NTZjZGQ4ZjAuLjczNjczYTgzZWI1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9wY2kvcHJvYmUuYw0KPiArKysgYi9kcml2ZXJzL3BjaS9wcm9iZS5jDQo+IEBAIC0xNjEwLDYg
KzE2MTAsNyBAQCBzdGF0aWMgdm9pZCBwY2lfc2V0X3JlbW92YWJsZShzdHJ1Y3QgcGNpX2RldiAq
ZGV2KQ0KPiAgIAkgKiBleHBvc2VkIGFzICJyZW1vdmFibGUiIHRvIHVzZXJzcGFjZS4NCj4gICAJ
ICovDQo+ICAgCWlmICh2c2VjIHx8DQo+ICsJICAgIGRldi0+Y2xhc3MgPT0gUENJX0NMQVNTX1NF
UklBTF9VU0JfVVNCNCB8fA0KPiAgIAkgICAgKHBhcmVudCAmJg0KPiAgIAkgICAgKHBhcmVudC0+
ZXh0ZXJuYWxfZmFjaW5nIHx8IGRldl9pc19yZW1vdmFibGUoJnBhcmVudC0+ZGV2KSkpKQ0KPiAg
IAkJZGV2X3NldF9yZW1vdmFibGUoJmRldi0+ZGV2LCBERVZJQ0VfUkVNT1ZBQkxFKTsNCj4gDQoN
ClJldmlld2VkLWJ5OiBNYWNwYXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KDQpU
aGFua3MhDQoNClJlZ2FyZHMsDQpNYWNwYXVsIExpbg==

--__=_Part_Boundary_005_1648681517.2033680023--

