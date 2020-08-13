Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407682438D1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF7B6E1FB;
	Thu, 13 Aug 2020 10:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27996E1FB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:45:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE6B551;
 Thu, 13 Aug 2020 12:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597315536;
 bh=uW9VG8L7uohIKIDyQFErTa9Bom9c0JitTWJGHjrtMBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4LKtUcfI19KJrA+6t0w9g7GZzxoDtN+AoYGLifVjEnd6+QVHofMU65o12GsHvWr4
 pWNFBQQDoN5XWn9tkEDgWaT5RRU8cn6inf9/O3VY49f6lSYx1p0kLGwBsquqGT9VNk
 BPgfZc4ZtUL/JGzGN0l0y0S9M/5yz1nCC6BJDQq8=
Date: Thu, 13 Aug 2020 13:45:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 4/6] drm/rockchip: dw_hdmi: Add vendor hdmi properties
Message-ID: <20200813104522.GA6057@pendragon.ideasonboard.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
 <20200812083543.4231-1-algea.cao@rock-chips.com>
 <20200812093315.GE6057@pendragon.ideasonboard.com>
 <52cca26d-b2b3-22b2-f371-a8086f2e6336@rock-chips.com>
 <20200812133017.GJ6057@pendragon.ideasonboard.com>
 <20200813104228.096179e7@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813104228.096179e7@eldfell>
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
Cc: jernej.skrabec@siol.net, crj <algea.cao@rock-chips.com>, jonas@kwiboo.se,
 airlied@linux.ie, sam@ravnborg.org, narmstrong@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com,
 laurent.pinchart+renesas@ideasonboard.com, tzimmermann@suse.de,
 cychiang@chromium.org, linux-rockchip@lists.infradead.org, darekm@google.com,
 kuankuan.y@gmail.com, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTA6NDI6MjhBTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gV2VkLCAxMiBBdWcgMjAyMCAxNjozMDoxNyArMDMwMCBMYXVyZW50IFBpbmNo
YXJ0IHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMTIsIDIwMjAgYXQgMDc6MDg6MTBQTSArMDgwMCwg
Y3JqIHdyb3RlOgo+ID4gPiDlnKggMjAyMC84LzEyIDE3OjMzLCBMYXVyZW50IFBpbmNoYXJ0IOWG
memBkzogIAo+ID4gPiA+IE9uIFdlZCwgQXVnIDEyLCAyMDIwIGF0IDA0OjM1OjQzUE0gKzA4MDAs
IEFsZ2VhIENhbyB3cm90ZTogIAo+ID4gPiA+PiBJbnRyb2R1Y2Ugc3RydWN0IGR3X2hkbWlfcHJv
cGVydHlfb3BzIGluIHBsYXRfZGF0YSB0byBzdXBwb3J0Cj4gPiA+ID4+IHZlbmRvciBoZG1pIHBy
b3BlcnR5Lgo+ID4gPiA+Pgo+ID4gPiA+PiBJbXBsZW1lbnQgaGRtaSB2ZW5kb3IgcHJvcGVydGll
cyBjb2xvcl9kZXB0aF9wcm9wZXJ0eSBhbmQKPiA+ID4gPj4gaGRtaV9vdXRwdXRfcHJvcGVydHkg
dG8gY29uZmlnIGhkbWkgb3V0cHV0IGNvbG9yIGRlcHRoIGFuZAo+ID4gPiA+PiBjb2xvciBmb3Jt
YXQuCj4gPiA+ID4+Cj4gPiA+ID4+IFRoZSBwcm9wZXJ0eSAiaGRtaV9vdXRwdXRfZm9ybWF0Iiwg
dGhlIHBvc3NpYmxlIHZhbHVlCj4gPiA+ID4+IGNvdWxkIGJlOgo+ID4gPiA+PiAgICAgICAgICAg
LSBSR0IKPiA+ID4gPj4gICAgICAgICAgIC0gWUNCQ1IgNDQ0Cj4gPiA+ID4+ICAgICAgICAgICAt
IFlDQkNSIDQyMgo+ID4gPiA+PiAgICAgICAgICAgLSBZQ0JDUiA0MjAKPiA+ID4gPj4KPiA+ID4g
Pj4gRGVmYXVsdCB2YWx1ZSBvZiB0aGUgcHJvcGVydHkgaXMgc2V0IHRvIDAgPSBSR0IsIHNvIG5v
IGNoYW5nZXMgaWYgeW91Cj4gPiA+ID4+IGRvbid0IHNldCB0aGUgcHJvcGVydHkuCj4gPiA+ID4+
Cj4gPiA+ID4+IFRoZSBwcm9wZXJ0eSAiaGRtaV9vdXRwdXRfZGVwdGgiIHBvc3NpYmxlIHZhbHVl
IGNvdWxkIGJlCj4gPiA+ID4+ICAgICAgICAgICAtIEF1dG9tYXRpYwo+ID4gPiA+PiAgICAgICAg
ICAgICBUaGlzIGluZGljYXRlcyBwcmVmZXIgaGlnaGVzdCBjb2xvciBkZXB0aCwgaXQgaXMKPiA+
ID4gPj4gICAgICAgICAgICAgMzBiaXQgb24gcm9ja2NpcCBwbGF0Zm9ybS4KPiA+ID4gPj4gICAg
ICAgICAgIC0gMjRiaXQKPiA+ID4gPj4gICAgICAgICAgIC0gMzBiaXQKPiA+ID4gPj4gVGhlIGRl
ZmF1bHQgdmFsdWUgb2YgcHJvcGVydHkgaXMgMjRiaXQuCj4gPiA+ID4+Cj4gPiA+ID4+IFNpZ25l
ZC1vZmYtYnk6IEFsZ2VhIENhbyA8YWxnZWEuY2FvQHJvY2stY2hpcHMuY29tPgo+ID4gPiA+PiAt
LS0KPiA+ID4gPj4KPiA+ID4gPj4gICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1y
b2NrY2hpcC5jIHwgMTc0ICsrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4+ICAgaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgICB8ICAyMiArKysKPiA+ID4gPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRpb25zKCspCj4gPiA+ID4+Cj4gPiA+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIGIvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwo+ID4gPiA+PiBpbmRleCAy
M2RlMzU5YTFkZWMuLjhmMjJkOWE1NjZkYiAxMDA2NDQKPiA+ID4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwo+ID4gPiA+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCj4gPiA+ID4+IEBAIC01Miw2ICs1
MiwyNyBAQAo+ID4gPiA+PiAgIAo+ID4gPiA+PiAgICNkZWZpbmUgSElXT1JEX1VQREFURSh2YWws
IG1hc2spCSh2YWwgfCAobWFzaykgPDwgMTYpCj4gPiA+ID4+ICAgCj4gPiA+ID4+ICsvKiBIRE1J
IG91dHB1dCBwaXhlbCBmb3JtYXQgKi8KPiA+ID4gPj4gK2VudW0gZHJtX2hkbWlfb3V0cHV0X3R5
cGUgewo+ID4gPiA+PiArCURSTV9IRE1JX09VVFBVVF9ERUZBVUxUX1JHQiwgLyogZGVmYXVsdCBS
R0IgKi8KPiA+ID4gPj4gKwlEUk1fSERNSV9PVVRQVVRfWUNCQ1I0NDQsIC8qIFlDQkNSIDQ0NCAq
Lwo+ID4gPiA+PiArCURSTV9IRE1JX09VVFBVVF9ZQ0JDUjQyMiwgLyogWUNCQ1IgNDIyICovCj4g
PiA+ID4+ICsJRFJNX0hETUlfT1VUUFVUX1lDQkNSNDIwLCAvKiBZQ0JDUiA0MjAgKi8KPiA+ID4g
Pj4gKwlEUk1fSERNSV9PVVRQVVRfWUNCQ1JfSFEsIC8qIEhpZ2hlc3Qgc3Vic2FtcGxlZCBZVVYg
Ki8KPiA+ID4gPj4gKwlEUk1fSERNSV9PVVRQVVRfWUNCQ1JfTFEsIC8qIExvd2VzdCBzdWJzYW1w
bGVkIFlVViAqLwo+ID4gPiA+PiArCURSTV9IRE1JX09VVFBVVF9JTlZBTElELCAvKiBHdWVzcyB3
aGF0ID8gKi8KPiA+ID4gPj4gK307ICAKPiA+ID4gPgo+ID4gPiA+IFZlbmRvci1zcGVjaWZpYyBw
cm9wZXJ0aWVzIHNob3VsZG4ndCB1c2UgbmFtZXMgc3RhcnRpbmcgd2l0aCBkcm1fIG9yCj4gPiA+
ID4gRFJNXywgdGhhdCdzIGZvciB0aGUgRFJNIGNvcmUuIEJ1dCB0aGlzIGRvZXNuJ3Qgc2VlbSBz
cGVjaWZpYyB0bwo+ID4gPiA+IFJvY2tjaGlwIGF0IGFsbCwgaXQgc2hvdWxkIGJlIGEgc3RhbmRh
cmQgcHJvcGVydHkuIEFkZGl0aW9uYWxseSwgbmV3Cj4gPiA+ID4gcHJvcGVydGllcyBuZWVkIHRv
IGNvbWUgd2l0aCBhIHVzZXJzcGFjZSBpbXBsZW1lbnRhdGlvbiBzaG93aW5nIHRoZWlyCj4gPiA+
ID4gdXNhZ2UsIGluIFgub3JnLCBXZXN0b24sIHRoZSBBbmRyb2lkIERSTS9LTVMgSFcgY29tcG9z
ZXIsIG9yIGFub3RoZXIKPiA+ID4gPiByZWxldmFudCB1cHN0cmVhbSBwcm9qZWN0IChhIHRlc3Qg
dG9vbCBpcyB1c3VhbGx5IG5vdCBlbm91Z2gpLiAgCj4gPiA+IAo+ID4gPiBXZSB1c2UgdGhlc2Ug
cHJvcGVydGllcyBvbmx5IGluIEFuZHJvaWQgSFcgY29tcG9zZXIsIEJ1dCB3ZSBjYW4ndCB1cHN0
cmVhbQo+ID4gPiAKPiA+ID4gb3VyIEhXIGNvbXBvc2VyIGNvZGUgcmlnaHQgbm93LsKgIENhbiB3
ZSB1c2UgdGhpcyBwcm9wZXJ0aWVzIGFzIHByaXZhdGUgCj4gPiA+IHByb3BlcnR5Cj4gPiA+IAo+
ID4gPiBhbmQgZG8gbm90IHVwc3RyZWFtIEhXIGNvbXBvc2VyIGZvciB0aGUgdGltZSBiZWluZz8g
IAo+ID4gCj4gPiBJdCdzIG5vdCBteSBkZWNpc2lvbiwgaXQncyBhIHBvbGljeSBvZiB0aGUgRFJN
IHN1YnN5c3RlbSB0byByZXF1aXJlIGFuCj4gPiBvcGVuIGltcGxlbWVudGF0aW9uIGluIHVzZXJz
cGFjZSB0byB2YWxpZGF0ZSBhbGwgQVBJIGFkZGl0aW9ucy4KPiAKPiBBbHNvIHJlYWQKPiBodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9ncHUvZHJtLXVhcGkuaHRtbCNvcGVu
LXNvdXJjZS11c2Vyc3BhY2UtcmVxdWlyZW1lbnRzCj4gdmVyeSBjYXJlZnVsbHk6IGl0IGNhbGxz
IGZvciBhIEZPU1MgdXNlcnNwYWNlIHByb2plY3QncyBwcm9wZXIgdXBzdHJlYW0KPiB0byBoYXZl
IHJldmlld2VkIGFuZCBhY2NlcHRlZCB0aGUgcGF0Y2hlcyB0byB1c2UgdGhlIG5ldyBVQVBJLCBi
dXQKPiB0aG9zZSBwYXRjaGVzIG11c3QgTk9UIGJlIE1FUkdFRCBhdCB0aGF0IHRpbWUgeWV0LgoK
Q29ycmVjdC4gTWFueSB1c2Vyc3BhY2UgcHJvamVjdHMgd291bGRuJ3QgbWVyZ2UgYSBwYXRjaCBi
ZWZvcmUgdGhlCmtlcm5lbCBBUEkgaXMgbWVyZ2VkLCBzbyB0aGF0IHdvdWxkIGNyZWF0ZSBhIGNo
aWNrZW4gYW5kIGVnZyBwcm9ibGVtIDotKQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
