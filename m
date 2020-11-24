Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BF2C3A9A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876566E854;
	Wed, 25 Nov 2020 08:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B66E22B;
 Tue, 24 Nov 2020 13:10:25 +0000 (UTC)
IronPort-SDR: SadUAcEo2Metyajv1TyufdzcSLvF6ubmCxtX4i7uwC/NnCKm1HhvojtwCfrFCA0Nrv/8eQhTum
 LppsFsF7GYYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171159333"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="171159333"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:10:25 -0800
IronPort-SDR: mJrVMzwaCSVvK+lHDeSxpNM70cSXr9AW1IGVs3JHPvbItXWdnnTDOwg0euZmoeNJzu+kADjFhY
 R37+4eR0PxCA==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="536470044"
Received: from ndavidso-mobl4.ger.corp.intel.com (HELO
 Win10on49-0007.SSPE.ch.intel.com) ([10.255.198.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:10:23 -0800
Subject: Re: [Intel-gfx] [PATCH] dma-buf/dma-resv: Respect num_fences when
 initializing the shared fence list.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20201124115707.406917-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <a40b62d6-3285-abe6-17b7-47b89a53d89f@linux.intel.com>
Date: Tue, 24 Nov 2020 14:10:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124115707.406917-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzI0LzIwIDEyOjU3IFBNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToKPiBXZSBoYXJk
Y29kZSB0aGUgbWF4aW11bSBudW1iZXIgb2Ygc2hhcmVkIGZlbmNlcyB0byA0LCBpbnN0ZWFkIG9m
Cj4gcmVzcGVjdGluZyBudW1fZmVuY2VzLiBVc2UgYSBtaW5pbXVtIG9mIDQsIGJ1dCBtb3JlIGlm
IG51bV9mZW5jZXMKPiBpcyBoaWdoZXIuCj4KPiBUaGlzIHNlZW1zIHRvIGhhdmUgYmVlbiBhbiBv
dmVyc2lnaHQgd2hlbiBmaXJzdCBpbXBsZW1lbnRpbmcgdGhlCj4gYXBpLgo+Cj4gRml4ZXM6IDA0
YTVmYWE4Y2JlNSAoInJlc2VydmF0aW9uOiB1cGRhdGUgYXBpIGFuZCBhZGQgc29tZSBoZWxwZXJz
IikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjMuMTcrCj4gUmVwb3J0ZWQtYnk6
IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50
ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLXJlc3Yu
YyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
