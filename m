Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8C2C3CD5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BDF6E8C7;
	Wed, 25 Nov 2020 09:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3A76E8C4;
 Wed, 25 Nov 2020 09:50:19 +0000 (UTC)
IronPort-SDR: zhyA54nyxNy1LXL15CAZsH+v8S4YUqdtY/FsRzdHIu3mu6RYYJybmv4wM2Xn3U6eSKTMhLROys
 XUUdQbR7opbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="171322962"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; d="scan'208";a="171322962"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 01:50:18 -0800
IronPort-SDR: NPpcqPMewZIMLnvDK7uUqQILjUinc1EZ0INqU3cxeQfmU/OZOltazDTXxtFspy7dZhg8GVzxzD
 VMC5iOjQAepw==
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; d="scan'208";a="478858066"
Received: from jclobus-mobl1.ger.corp.intel.com (HELO [10.252.55.230])
 ([10.252.55.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 01:50:17 -0800
Subject: Re: [Intel-gfx] [PATCH] dma-buf/dma-resv: Respect num_fences when
 initializing the shared fence list.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20201124115707.406917-1-maarten.lankhorst@linux.intel.com>
 <a40b62d6-3285-abe6-17b7-47b89a53d89f@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <95ae2c09-4907-4f99-6669-1858ae5499aa@linux.intel.com>
Date: Wed, 25 Nov 2020 10:50:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a40b62d6-3285-abe6-17b7-47b89a53d89f@linux.intel.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjQtMTEtMjAyMCBvbSAxNDoxMCBzY2hyZWVmIFRob21hcyBIZWxsc3Ryw7ZtOgo+Cj4gT24g
MTEvMjQvMjAgMTI6NTcgUE0sIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+PiBXZSBoYXJkY29k
ZSB0aGUgbWF4aW11bSBudW1iZXIgb2Ygc2hhcmVkIGZlbmNlcyB0byA0LCBpbnN0ZWFkIG9mCj4+
IHJlc3BlY3RpbmcgbnVtX2ZlbmNlcy4gVXNlIGEgbWluaW11bSBvZiA0LCBidXQgbW9yZSBpZiBu
dW1fZmVuY2VzCj4+IGlzIGhpZ2hlci4KPj4KPj4gVGhpcyBzZWVtcyB0byBoYXZlIGJlZW4gYW4g
b3ZlcnNpZ2h0IHdoZW4gZmlyc3QgaW1wbGVtZW50aW5nIHRoZQo+PiBhcGkuCj4+Cj4+IEZpeGVz
OiAwNGE1ZmFhOGNiZTUgKCJyZXNlcnZhdGlvbjogdXBkYXRlIGFwaSBhbmQgYWRkIHNvbWUgaGVs
cGVycyIpCj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2My4xNysKPj4gUmVwb3J0
ZWQtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1
cmFAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9kbWEtYnVm
L2RtYS1yZXN2LmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pgo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Cj4KPgpUaGFua3MsIHB1c2hlZCEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
