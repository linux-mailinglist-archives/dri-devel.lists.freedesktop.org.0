Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E7DEB23
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 13:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6389F85;
	Mon, 21 Oct 2019 11:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7789F85;
 Mon, 21 Oct 2019 11:40:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 04:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="209428465"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 04:40:18 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 14:40:17 +0300
Date: Mon, 21 Oct 2019 14:40:17 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191021114017.GY2819@lahna.fi.intel.com>
References: <20191016144449.24646-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016144449.24646-1-kherbst@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2Fyb2wsCgpTb3JyeSBmb3IgY29tbWVudGluZyBsYXRlLCBJIGp1c3QgY2FtZSBiYWNrIGZy
b20gdmFjYXRpb24uCgpPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwNDo0NDo0OVBNICswMjAwLCBL
YXJvbCBIZXJic3Qgd3JvdGU6Cj4gRml4ZXMgc3RhdGUgdHJhbnNpdGlvbnMgb2YgTnZpZGlhIFBh
c2NhbCBHUFVzIGZyb20gRDNjb2xkIGludG8gaGlnaGVyIGRldmljZQo+IHN0YXRlcy4KPiAKPiB2
MjogY29udmVydCB0byBwY2lfZGV2IHF1aXJrCj4gICAgIHB1dCBhIHByb3BlciB0ZWNobmljYWwg
ZXhwbGFuYXRpb24gb2YgdGhlIGlzc3VlIGFzIGEgaW4tY29kZSBjb21tZW50Cj4gdjM6IGRpc2Fi
bGUgaXQgb25seSBmb3IgY2VydGFpbiBjb21iaW5hdGlvbnMgb2YgaW50ZWwgYW5kIG52aWRpYSBo
YXJkd2FyZQo+IAo+IFNpZ25lZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQu
Y29tPgo+IENjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+IENjOiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IENjOiBSYWZhZWwgSi4gV3lzb2NraSA8cmp3QHJq
d3lzb2NraS5uZXQ+Cj4gQ2M6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGludGVs
LmNvbT4KPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1wbUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBu
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0tLQo+ICBkcml2ZXJzL3BjaS9wY2kuYyAg
ICB8IDExICsrKysrKysrKysKPiAgZHJpdmVycy9wY2kvcXVpcmtzLmMgfCA1MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwoKSSBtYXkgYmUgbWlzc2luZyBzb21l
dGhpbmcgYnV0IHdoeSB5b3UgY2FuJ3QgZG8gdGhpcyBpbiB0aGUgbm91dmVhdQpkcml2ZXIgaXRz
ZWxmPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
