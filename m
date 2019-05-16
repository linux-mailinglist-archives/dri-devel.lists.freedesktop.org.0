Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E22033C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A210A89337;
	Thu, 16 May 2019 10:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4814989337
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:14:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED7C3320;
 Thu, 16 May 2019 12:14:54 +0200 (CEST)
Date: Thu, 16 May 2019 13:14:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
Message-ID: <20190516101438.GD4995@pendragon.ideasonboard.com>
References: <20190502223808.185180-1-dianders@chromium.org>
 <20190502223808.185180-2-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502223808.185180-2-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558001695;
 bh=hdHDpOn6XPeT8HCeSsf6x0SVf0Wl4BDWp5vvALPWmUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AqEuEc+3Hkk+pq/L7bssYGNH3Yllxa/OlVeqwuBQkQdGyAkzaQU6EeJfTk8WVJnPs
 MjsLwRz1GcjHCRDFkQlUdbPypKpo5WOf0+nyM2iAS+nk86NSrM0MaqfojXDCwZ8JKa
 0fz6L4cv85S3qT8xR0hIekDP5rSwZGn5lYYdQ1fc=
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2xhcywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBNYXkgMDIsIDIw
MTkgYXQgMDM6Mzg6MDhQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiBPbiBSb2Nr
Y2hpcCByazMyODgtYmFzZWQgQ2hyb21lYm9va3Mgd2hlbiB5b3UgZG8gYSBzdXNwZW5kL3Jlc3Vt
ZQo+IGN5Y2xlOgo+IAo+IDEuIFlvdSBsb3NlIHRoZSBhYmlsaXR5IHRvIGRldGVjdCBhbiBIRE1J
IGRldmljZSBiZWluZyBwbHVnZ2VkIGluLgo+IAo+IDIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJj
IGJ1cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKPiB3b3JraW5nLgo+IAo+IExl
dCdzIGNhbGwgdGhlIGNvcmUgZHctaGRtaSdzIHN1c3BlbmQvcmVzdW1lIGZ1bmN0aW9ucyB0byBy
ZXN0b3JlCj4gdGhpbmdzLgo+IAo+IE5PVEU6IGluIGRvd25zdHJlYW0gQ2hyb21lIE9TIChiYXNl
ZCBvbiBrZXJuZWwgMy4xNCkgd2UgdXNlZCB0aGUKPiAibGF0ZS9lYXJseSIgdmVyc2lvbnMgb2Yg
c3VzcGVuZC9yZXN1bWUgYmVjYXVzZSB3ZSBmb3VuZCB0aGF0IHRoZSBWT1AKPiB3YXMgc29tZXRp
bWVzIHJlc3VtaW5nIGJlZm9yZSBkd19oZG1pIGFuZCB0aGVuIGNhbGxpbmcgaW50byB1cyBiZWZv
cmUKPiB3ZSB3ZXJlIGZ1bGx5IHJlc3VtZWQuICBGb3Igbm93IEkgaGF2ZSBnb25lIGJhY2sgdG8g
dGhlIG5vcm1hbAo+IHN1c3BlbmQvcmVzdW1lIGJlY2F1c2UgSSBjYW4ndCByZXByb2R1Y2UgdGhl
IHByb2JsZW1zLgoKU2hvdWxkIHRoaXMgYmUgc29sdmVkIHdpdGggZGV2aWNlIGxpbmtzIGlmIG5l
ZWRlZCA/Cgo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KPiAtLS0KPiAKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9j
a2NoaXAuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9k
d19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2Nr
Y2hpcC5jCj4gaW5kZXggNGNkYzlmODZjMmU1Li5kZWIwZThjMzBjMDMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKPiBAQCAtNTQyLDExICs1NDIs
MzEgQEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tjaGlwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgZHdfaGRtaV9yb2NrY2hpcF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAr
ewo+ICsJc3RydWN0IHJvY2tjaGlwX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
PiArCj4gKwlyZXR1cm4gZHdfaGRtaV9zdXNwZW5kKGhkbWktPmhkbWkpOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3X2hkbWlfcm9ja2NoaXBfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiArewo+ICsJc3RydWN0IHJvY2tjaGlwX2hkbWkgKmhkbWkgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiArCj4gKwlyZXR1cm4gZHdfaGRtaV9yZXN1bWUoaGRtaS0+aGRtaSk7
Cj4gK30KPiArCj4gK2NvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3X2hkbWlfcm9ja2NoaXBfcG0g
PSB7CgpNaXNzaW5nIHN0YXRpYyBrZXl3b3JkID8KCkFwYXJ0IGZyb20gdGhpcywKClJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
Cgo+ICsJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMoZHdfaGRtaV9yb2NrY2hpcF9zdXNwZW5kLAo+
ICsJCQkJZHdfaGRtaV9yb2NrY2hpcF9yZXN1bWUpCj4gK307Cj4gKwo+ICBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIGR3X2hkbWlfcm9ja2NoaXBfcGx0Zm1fZHJpdmVyID0gewo+ICAJLnByb2JlICA9
IGR3X2hkbWlfcm9ja2NoaXBfcHJvYmUsCj4gIAkucmVtb3ZlID0gZHdfaGRtaV9yb2NrY2hpcF9y
ZW1vdmUsCj4gIAkuZHJpdmVyID0gewo+ICAJCS5uYW1lID0gImR3aGRtaS1yb2NrY2hpcCIsCj4g
KwkJLnBtID0gJmR3X2hkbWlfcm9ja2NoaXBfcG0sCj4gIAkJLm9mX21hdGNoX3RhYmxlID0gZHdf
aGRtaV9yb2NrY2hpcF9kdF9pZHMsCj4gIAl9LAo+ICB9OwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
