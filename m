Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCB46EEBF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0F010E966;
	Thu,  9 Dec 2021 16:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BAB10E118;
 Thu,  9 Dec 2021 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639044896; x=1670580896;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6GaGGybuD5jyS89D706n8UyUYB4xc8uQdzORCxu/uVM=;
 b=S6D+tKQ6WDsNhQUye9esxyt36j1ex5CyeYbM4zLAPf59zv4P4499SIi2
 6+UUtO/RpLW5EPuWttDm93yH3qCGr0ozw7a9I/za5g7iMiBtd90v9b5Dc
 JmgFgO7vsaDMtn1Z0tKhqSnyDxnNwRr+KRXQOhJmnlGqOvjrztqtoXgm/
 V0bnQhlvuNCPmF0SDcXcQcmeyxAKw5YQvMQtn6Lbt9WfpS0dqFI9sqJe8
 7KqJ9xpO9RW1BRfFPOD8vwRKGkrBmw/O/pjFUjqP0itKgofQTxUPYLaY6
 11BfGdD+JHXfNV92B63izOJnTv81gcFxFQnG+y0EsziWuhwg3muDP+b6Q Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218090133"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218090133"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 02:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="752373766"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 09 Dec 2021 02:14:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 02:14:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 02:14:55 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.020;
 Thu, 9 Dec 2021 02:14:55 -0800
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [v3 1/3] drm/i915/rpl-s: Add PCI IDS for Raptor Lake S
Thread-Topic: [v3 1/3] drm/i915/rpl-s: Add PCI IDS for Raptor Lake S
Thread-Index: AQHX6BA8xSVVPz4YL0ScwI7K71mkdawpojGAgABY0IA=
Date: Thu, 9 Dec 2021 10:14:54 +0000
Message-ID: <5a222e8a066a4becb06a4a9b004715ae@intel.com>
References: <20211203063545.2254380-1-anusha.srivatsa@intel.com>
 <20211203063545.2254380-2-anusha.srivatsa@intel.com>
 <659bed84-f675-8f65-8eeb-f91bb5ed905e@intel.com>
In-Reply-To: <659bed84-f675-8f65-8eeb-f91bb5ed905e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, "Souza, Jose" <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFuc2VuLCBEYXZlIDxk
YXZlLmhhbnNlbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciA5LCAyMDIx
IDI6MjcgQU0NCj4gVG86IFNyaXZhdHNhLCBBbnVzaGEgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5j
b20+OyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogeDg2QGtlcm5l
bC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEluZ28gTW9sbmFyDQo+IDxt
aW5nb0ByZWRoYXQuY29tPjsgQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+OyBEYXZlIEhh
bnNlbg0KPiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPjsgSm9vbmFzIExhaHRpbmVuDQo+
IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgVHZydGtvIFVyc3VsaW4NCj4gPHR2
cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tPjsNCj4gU291emEsIEpvc2UgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW3YzIDEvM10gZHJtL2k5MTUvcnBsLXM6IEFkZCBQQ0kgSURTIGZvciBSYXB0b3IgTGFr
ZSBTDQo+IA0KPiBPbiAxMi8yLzIxIDEwOjM1IFBNLCBBbnVzaGEgU3JpdmF0c2Egd3JvdGU6DQo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYw0KPiA+IGIvYXJj
aC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jIGluZGV4IDM5MWE0ZTJiODYwNC4uZmQyZDNhYjM4
ZWJiDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5j
DQo+ID4gKysrIGIvYXJjaC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jDQo+ID4gQEAgLTU1NCw2
ICs1NTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgaW50ZWxfZWFybHlf
aWRzW10NCj4gX19pbml0Y29uc3QgPSB7DQo+ID4gIAlJTlRFTF9SS0xfSURTKCZnZW4xMV9lYXJs
eV9vcHMpLA0KPiA+ICAJSU5URUxfQURMU19JRFMoJmdlbjExX2Vhcmx5X29wcyksDQo+ID4gIAlJ
TlRFTF9BRExQX0lEUygmZ2VuMTFfZWFybHlfb3BzKSwNCj4gPiArCUlOVEVMX1JQTFNfSURTKCZn
ZW4xMV9lYXJseV9vcHMpLA0KPiA+ICB9Ow0KPiANCj4gRm9yIGFyY2gveDg2IHB1cnBvc2VzOg0K
PiANCj4gQWNrZWQtYnk6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+
CQ0KDQpUaGFua3MgZm9yIHRoZSBhY2shDQoNCkFudXNoYQ0K
