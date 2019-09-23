Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B1BB463
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573586E8CB;
	Mon, 23 Sep 2019 12:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599BD6E8C7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 05:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; d="scan'208";a="272268468"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 23 Sep 2019 05:53:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2019 15:53:15 +0300
Date: Mon, 23 Sep 2019 15:53:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 01/36] drm/fourcc: Add 2 plane YCbCr 10bit format support
Message-ID: <20190923125314.GJ1208@intel.com>
References: <1569242365-182133-1-git-send-email-hjc@rock-chips.com>
 <1569242365-182133-2-git-send-email-hjc@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569242365-182133-2-git-send-email-hjc@rock-chips.com>
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

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDg6Mzg6NTBQTSArMDgwMCwgU2FuZHkgSHVhbmcgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVk
ZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBpbmRleCAzZmVlYWEzLi41ZmU4OWU5IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmgKPiBAQCAtMjY2LDYgKzI2NiwyMSBAQCBleHRlcm4gIkMiIHsKPiAg
I2RlZmluZSBEUk1fRk9STUFUX1AwMTYJCWZvdXJjY19jb2RlKCdQJywgJzAnLCAnMScsICc2Jykg
LyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgMTYgYml0cyBwZXIgY2hhbm5lbCAqLwo+ICAK
PiAgLyoKPiArICogMiBwbGFuZSBZQ2JDciAxMGJpdAo+ICsgKiBpbmRleCAwID0gWSBwbGFuZSwg
Wzk6MF0gWQo+ICsgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXSBDcjpDYiBsaXR0bGUg
ZW5kaWFuCj4gKyAqIG9yCj4gKyAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwgWzE5OjBdIENiOkNy
IGxpdHRsZSBlbmRpYW4KCldoYXQgZG9lcyAibGl0dGxlIGVuZGlhbiIgZXZlbiBtZWFuIGZvciB0
aGVzZT8KCj4gKyAqLwo+ICsKPiArI2RlZmluZSBEUk1fRk9STUFUX05WMTJfMTAJZm91cmNjX2Nv
ZGUoJ04nLCAnQScsICcxJywgJzInKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+
ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyMV8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzInLCAn
MScpIC8qIDJ4MiBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1B
VF9OVjE2XzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2JykgLyogMngxIHN1YnNhbXBs
ZWQgQ3I6Q2IgcGxhbmUgKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX05WNjFfMTAJZm91cmNjX2Nv
ZGUoJ04nLCAnQScsICc2JywgJzEnKSAvKiAyeDEgc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+
ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyNF8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzInLCAn
NCcpIC8qIG5vbi1zdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1B
VF9OVjQyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcsICcyJykgLyogbm9uLXN1YnNhbXBs
ZWQgQ2I6Q3IgcGxhbmUgKi8KPiArCj4gKy8qCj4gICAqIDMgcGxhbmUgWUNiQ3IKPiAgICogaW5k
ZXggMDogWSBwbGFuZSwgWzc6MF0gWQo+ICAgKiBpbmRleCAxOiBDYiBwbGFuZSwgWzc6MF0gQ2IK
PiAtLSAKPiAyLjcuNAo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
