Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5139CBBB9A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 20:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AFA6E99A;
	Mon, 23 Sep 2019 18:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF6D6E99A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 18:30:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 11:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="188220258"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 23 Sep 2019 11:30:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2019 21:30:49 +0300
Date: Mon, 23 Sep 2019 21:30:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "sandy.huang" <hjc@rock-chips.com>
Subject: Re: [PATCH 01/36] drm/fourcc: Add 2 plane YCbCr 10bit format support
Message-ID: <20190923183049.GR1208@intel.com>
References: <1569242365-182133-1-git-send-email-hjc@rock-chips.com>
 <1569242365-182133-2-git-send-email-hjc@rock-chips.com>
 <20190923125314.GJ1208@intel.com>
 <82664d48-36de-15fd-3b30-a12907e5bfcd@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82664d48-36de-15fd-3b30-a12907e5bfcd@rock-chips.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDY6MDU6MjJBTSAtMDcwMCwgc2FuZHkuaHVhbmcgd3Jv
dGU6Cj4gCj4g5ZyoIDIwMTkvOS8yMyDkuIrljYg1OjUzLCBWaWxsZSBTeXJqw6Rsw6Qg5YaZ6YGT
Ogo+ID4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDg6Mzg6NTBQTSArMDgwMCwgU2FuZHkgSHVh
bmcgd3JvdGU6Cj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5o
IGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+PiBpbmRleCAzZmVlYWEzLi41ZmU4
OWU5IDEwMDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPj4g
KysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+PiBAQCAtMjY2LDYgKzI2Niwy
MSBAQCBleHRlcm4gIkMiIHsKPiA+PiAgICNkZWZpbmUgRFJNX0ZPUk1BVF9QMDE2CQlmb3VyY2Nf
Y29kZSgnUCcsICcwJywgJzEnLCAnNicpIC8qIDJ4MiBzdWJzYW1wbGVkIENyOkNiIHBsYW5lIDE2
IGJpdHMgcGVyIGNoYW5uZWwgKi8KPiA+PiAgIAo+ID4+ICAgLyoKPiA+PiArICogMiBwbGFuZSBZ
Q2JDciAxMGJpdAo+ID4+ICsgKiBpbmRleCAwID0gWSBwbGFuZSwgWzk6MF0gWQo+ID4+ICsgKiBp
bmRleCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXSBDcjpDYiBsaXR0bGUgZW5kaWFuCj4gPj4gKyAq
IG9yCj4gPj4gKyAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwgWzE5OjBdIENiOkNyIGxpdHRsZSBl
bmRpYW4KPiA+IFdoYXQgZG9lcyAibGl0dGxlIGVuZGlhbiIgZXZlbiBtZWFuIGZvciB0aGVzZT8K
PiAKPiBJdCdzIEluaGVyaXRlZCBmcm9tIHRoZSBmb2xsb3dpbmcgZGVmaW5lLCB0aGUgZGlmZmVy
ZW5jZSBpcyA4Yml0IGFuZCAxMGJpdC4KPiAvKgo+ICDCoCogMiBwbGFuZSBZQ2JDcgo+ICDCoCog
aW5kZXggMCA9IFkgcGxhbmUsIFs3OjBdIFkKPiAgwqAqIGluZGV4IDEgPSBDcjpDYiBwbGFuZSwg
WzE1OjBdIENyOkNiIGxpdHRsZSBlbmRpYW4KPiAgwqAqIG9yCj4gIMKgKiBpbmRleCAxID0gQ2I6
Q3IgcGxhbmUsIFsxNTowXSBDYjpDciBsaXR0bGUgZW5kaWFuCj4gIMKgKi8KPiAjZGVmaW5lIERS
TV9GT1JNQVRfTlYxMsKgwqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICcxJywgJzIn
KSAvKiAyeDIgCj4gc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+ICNkZWZpbmUgRFJNX0ZPUk1B
VF9OVjIxwqDCoMKgIMKgwqDCoCBmb3VyY2NfY29kZSgnTicsICdWJywgJzInLCAnMScpIC8qIDJ4
MiAKPiBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4gI2RlZmluZSBEUk1fRk9STUFUX05WMTbC
oMKgwqAgwqDCoMKgIGZvdXJjY19jb2RlKCdOJywgJ1YnLCAnMScsICc2JykgLyogMngxIAo+IHN1
YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPiAjZGVmaW5lIERSTV9GT1JNQVRfTlY2McKgwqDCoCDC
oMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICc2JywgJzEnKSAvKiAyeDEgCj4gc3Vic2FtcGxl
ZCBDYjpDciBwbGFuZSAqLwo+ICNkZWZpbmUgRFJNX0ZPUk1BVF9OVjI0wqDCoMKgIMKgwqDCoCBm
b3VyY2NfY29kZSgnTicsICdWJywgJzInLCAnNCcpIC8qIAo+IG5vbi1zdWJzYW1wbGVkIENyOkNi
IHBsYW5lICovCj4gI2RlZmluZSBEUk1fRk9STUFUX05WNDLCoMKgwqAgwqDCoMKgIGZvdXJjY19j
b2RlKCdOJywgJ1YnLCAnNCcsCgpTb21ldGhpbmcgbm90IGFsaWduZWQgdG8gYnl0ZXMgY2FuJ3Qg
aGF2ZSBpdHMgZW5kaWFubmVzcyBkZWZpbmVkIHRoZQpzYW1lIHdheSBhcyB0aGVzZS4gSnVzdCBk
b2Vzbid0IG1ha2Ugc2Vuc2UuCgo+Cj4gCj4gCj4gPgo+ID4+ICsgKi8KPiA+PiArCj4gPj4gKyNk
ZWZpbmUgRFJNX0ZPUk1BVF9OVjEyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICcyJykg
LyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPiA+PiArI2RlZmluZSBEUk1fRk9STUFU
X05WMjFfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICcyJywgJzEnKSAvKiAyeDIgc3Vic2FtcGxl
ZCBDYjpDciBwbGFuZSAqLwo+ID4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYxNl8xMAlmb3VyY2Nf
Y29kZSgnTicsICdBJywgJzEnLCAnNicpIC8qIDJ4MSBzdWJzYW1wbGVkIENyOkNiIHBsYW5lICov
Cj4gPj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjYxXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAn
NicsICcxJykgLyogMngxIHN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPiA+PiArI2RlZmluZSBE
Uk1fRk9STUFUX05WMjRfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICcyJywgJzQnKSAvKiBub24t
c3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+ID4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlY0Ml8x
MAlmb3VyY2NfY29kZSgnTicsICdBJywgJzQnLCAnMicpIC8qIG5vbi1zdWJzYW1wbGVkIENiOkNy
IHBsYW5lICovCj4gPj4gKwo+ID4+ICsvKgo+ID4+ICAgICogMyBwbGFuZSBZQ2JDcgo+ID4+ICAg
ICogaW5kZXggMDogWSBwbGFuZSwgWzc6MF0gWQo+ID4+ICAgICogaW5kZXggMTogQ2IgcGxhbmUs
IFs3OjBdIENiCj4gPj4gLS0gCj4gPj4gMi43LjQKPiA+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAK
Ci0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
