Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62245C9FC4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237DE6E9DB;
	Thu,  3 Oct 2019 13:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A216E9DB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:44:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 06:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="205623986"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 06:44:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2019 16:44:17 +0300
Date: Thu, 3 Oct 2019 16:44:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Johan Korsnes <jkorsnes@cisco.com>
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Message-ID: <20191003134417.GF1208@intel.com>
References: <20191003071549.31272-1-jkorsnes@cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003071549.31272-1-jkorsnes@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDk6MTU6NDlBTSArMDIwMCwgSm9oYW4gS29yc25lcyB3
cm90ZToKPiBXaGVuIGxvZ2dpbmcgdGhlIEFWSSBJbmZvRnJhbWUsIGNsZWFybHkgaW5kaWNhdGUg
d2hldGhlciBvciBub3QgdGhlCj4gZXh0ZW5kZWQgY29sb3JpbWV0cnkgYXR0cmlidXRlIGlzIGFj
dGl2ZS4gVGhpcyBpcyBvbmx5IHRoZSBjYXNlIHdoZW4KPiB0aGUgQVZJIEluZm9GcmFtZSBjb2xv
cmltZXRyeSBhdHRyaWJ1dGUgaXMgc2V0IHRvIGV4dGVuZGVkLiBbMF0KPiAKPiBbMF0gQ1RBLTg2
MS1HIHNlY3Rpb24gNi40IHBhZ2UgNTcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBLb3JzbmVz
IDxqa29yc25lc0BjaXNjby5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vaGRtaS5jIHwgOCAr
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIvZHJpdmVycy92aWRlby9o
ZG1pLmMKPiBpbmRleCBmMjlkYjcyOGZmMjkuLmE3MDllMzhhNTNjYSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jCj4gQEAgLTY4
Miw4ICs2ODIsMTQgQEAgc3RhdGljIHZvaWQgaGRtaV9hdmlfaW5mb2ZyYW1lX2xvZyhjb25zdCBj
aGFyICpsZXZlbCwKPiAgCWhkbWlfbG9nKCIgICAgYWN0aXZlIGFzcGVjdDogJXNcbiIsCj4gIAkJ
CWhkbWlfYWN0aXZlX2FzcGVjdF9nZXRfbmFtZShmcmFtZS0+YWN0aXZlX2FzcGVjdCkpOwo+ICAJ
aGRtaV9sb2coIiAgICBpdGM6ICVzXG4iLCBmcmFtZS0+aXRjID8gIklUIENvbnRlbnQiIDogIk5v
IERhdGEiKTsKPiAtCWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQgY29sb3JpbWV0cnk6ICVzXG4iLAo+
ICsKPiArCWlmIChmcmFtZS0+Y29sb3JpbWV0cnkgPT0gSERNSV9DT0xPUklNRVRSWV9FWFRFTkRF
RCkKPiArCQloZG1pX2xvZygiICAgIGV4dGVuZGVkIGNvbG9yaW1ldHJ5OiAlc1xuIiwKPiAgCQkJ
aGRtaV9leHRlbmRlZF9jb2xvcmltZXRyeV9nZXRfbmFtZShmcmFtZS0+ZXh0ZW5kZWRfY29sb3Jp
bWV0cnkpKTsKPiArCWVsc2UKPiArCQloZG1pX2xvZygiICAgIGV4dGVuZGVkIGNvbG9yaW1ldHJ5
OiBOL0EgKDB4JXgpXG4iLAo+ICsJCQlmcmFtZS0+ZXh0ZW5kZWRfY29sb3JpbWV0cnkpOwoKWWVh
aCwgc2VlbXMgZmluZS4gTWlnaHQgbWFrZSB0aGUgbG9ncyBhIGJpdCBsZXNzIGNvbmZ1c2luZyBh
dCBsZWFzdC4KClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgoKUFMuIHdvdWxkIGJlIG5pY2UgaXQgc29tZW9uZSB3ZXJlIHRvIGV4dGVu
ZCB0aGlzIGNvZGUgdG8gZGVhbCB3aXRoIHRoZQpBQ0UgYml0cyB0b28uIERvIHlvdSBoYXZlIHBs
YW5zL2ludGVyZXN0IGluIGRvaW5nIHRoYXQ/Cgo+ICsKPiAgCWhkbWlfbG9nKCIgICAgcXVhbnRp
emF0aW9uIHJhbmdlOiAlc1xuIiwKPiAgCQkJaGRtaV9xdWFudGl6YXRpb25fcmFuZ2VfZ2V0X25h
bWUoZnJhbWUtPnF1YW50aXphdGlvbl9yYW5nZSkpOwo+ICAJaGRtaV9sb2coIiAgICBudXBzOiAl
c1xuIiwgaGRtaV9udXBzX2dldF9uYW1lKGZyYW1lLT5udXBzKSk7Cj4gLS0gCj4gMi4yMC4xCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgot
LSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
