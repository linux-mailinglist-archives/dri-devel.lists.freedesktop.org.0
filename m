Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE431E2150
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 19:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA1B6E157;
	Wed, 23 Oct 2019 17:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFD26E157
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:03:35 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95B3121E6F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:03:35 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d17so18721568qto.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 10:03:35 -0700 (PDT)
X-Gm-Message-State: APjAAAVCQ44/x1Wjz7R8DrWQt8UMTHMLV6AZpaFIfpm7YbXPxycBKKun
 1O6NVelU0KVXplaLY94CZlIoevagGFTMyHVUWg==
X-Google-Smtp-Source: APXvYqydyP5/fo5/99UQI9czsCJqaOzK2MK1XOv+Xr/dtt91fbc56oj9LdcqusUtndMeC7d+VytU1zFYCVFVz2cOJ0Y=
X-Received: by 2002:ac8:293b:: with SMTP id y56mr10449944qty.224.1571850214685; 
 Wed, 23 Oct 2019 10:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-3-robh@kernel.org>
 <20191022111443.GE4756@pendragon.ideasonboard.com>
 <CAL_Jsq+kyLZ8LAVN-5UDJUy9nMLiAjN452HWg5WYAfLS7QD=Yw@mail.gmail.com>
 <20191023142844.GC1904@pendragon.ideasonboard.com>
In-Reply-To: <20191023142844.GC1904@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 12:03:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLTqBW8-hUbj37MKx8-8YOXwLWRSsQ5g_Jh+i86LReOmw@mail.gmail.com>
Message-ID: <CAL_JsqLTqBW8-hUbj37MKx8-8YOXwLWRSsQ5g_Jh+i86LReOmw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571850215;
 bh=ihBP6BXDEvO8yUMGC7tug3Z2exooYjvRbgn9CV5bTLQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yt+R8SVz2QRw0MKgNErw43SEf7W63p5bM02gjWmXwwVyMkvYolLSgZIUgD97HvVo8
 0pZw+pb5YgS+2DaNTF+cVeVffCg3QWMar/Uj3LRoYtQ3/mi6XeJi+9qdYJuyl+ubZd
 grRtNhkx5jfyBJFoi/fYMbQXoP1h1zvqp4TNfsHQ=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgOToyOCBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gVHVl
LCBPY3QgMjIsIDIwMTkgYXQgMDc6NDI6MDZBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4g
PiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCA2OjE0IEFNIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gPiA+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDA0OjQ1OjQ2UE0gLTA1MDAsIFJvYiBIZXJy
aW5nIHdyb3RlOgo+ID4gPiA+IEludHJvZHVjZSBhIG5ldyBmbGFnLCBEUk1fTU9ERV9EVU1CX0tF
Uk5FTF9NQVAsIGZvciBzdHJ1Y3QKPiA+ID4gPiBkcm1fbW9kZV9jcmVhdGVfZHVtYi4gVGhpcyBm
bGFnIGlzIGZvciBpbnRlcm5hbCBrZXJuZWwgdXNlIHRvIGluZGljYXRlCj4gPiA+ID4gaWYgZHVt
YiBidWZmZXIgYWxsb2NhdGlvbiBuZWVkcyBhIGtlcm5lbCBtYXBwaW5nLiBUaGlzIGlzIG5lZWRl
ZCBvbmx5IGZvcgo+ID4gPiA+IENNQSB3aGVyZSBjcmVhdGluZyBhIGtlcm5lbCBtYXBwaW5nIG9y
IG5vdCBoYXMgdG8gYmUgZGVjaWRlZCBhdCBhbGxvY2F0aW9uCj4gPiA+ID4gdGltZSBiZWNhdXNl
IGNyZWF0aW5nIGEgbWFwcGluZyBvbiBkZW1hbmQgKHdpdGggdm1hcCgpKSBpcyBub3QgZ3VhcmFu
dGVlZAo+ID4gPiA+IHRvIHdvcmsuIFNldmVyYWwgZHJpdmVycyBhcmUgdXNpbmcgQ01BLCBidXQg
bm90IHRoZSBDTUEgaGVscGVycyBiZWNhdXNlCj4gPiA+ID4gdGhleSBkaXN0aW5ndWlzaCBiZXR3
ZWVuIGtlcm5lbCBhbmQgdXNlcnNwYWNlIGFsbG9jYXRpb25zIHRvIGNyZWF0ZSBhCj4gPiA+ID4g
a2VybmVsIG1hcHBpbmcgb3Igbm90Lgo+ID4gPiA+Cj4gPiA+ID4gVXBkYXRlIHRoZSBjYWxsZXJz
IG9mIGRybV9tb2RlX2R1bWJfY3JlYXRlKCkgdG8gc2V0Cj4gPiA+ID4gZHJtX21vZGVfZHVtYl9j
cmVhdGUuZmxhZ3MgdG8gYXBwcm9wcmlhdGUgZGVmYXVsdHMuIEN1cnJlbnRseSwgZmxhZ3MgY2Fu
Cj4gPiA+ID4gYmUgc2V0IHRvIGFueXRoaW5nIGJ5IHVzZXJzcGFjZSwgYnV0IGlzIHVudXNlZCB3
aXRoaW4gdGhlIGtlcm5lbC4gTGV0J3MKPiA+ID4gPiBmb3JjZSBmbGFncyB0byB6ZXJvIChubyBr
ZXJuZWwgbWFwcGluZykgZm9yIHVzZXJzcGFjZSBjYWxsZXJzIGJ5IGRlZmF1bHQuCj4gPiA+ID4g
Rm9yIGluIGtlcm5lbCBjbGllbnRzLCBzZXQgRFJNX01PREVfRFVNQl9LRVJORUxfTUFQIGJ5IGRl
ZmF1bHQuIERyaXZlcnMKPiA+ID4gPiBjYW4gb3ZlcnJpZGUgdGhpcyBhcyBuZWVkZWQuCj4gPiA+
ID4KPiA+ID4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gPiA+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IE1h
eGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+ID4gPiBDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnQuYyAgICAgICB8IDEgKwo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVy
cy5jIHwgNSArKysrLQo+ID4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgICAg
IHwgMiArKwo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y2xpZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jCj4gPiA+ID4gaW5kZXggZDlh
MmUzNjk1NTI1Li5kYmZjODA2MWIzOTIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jbGllbnQuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50
LmMKPiA+ID4gPiBAQCAtMjY0LDYgKzI2NCw3IEBAIGRybV9jbGllbnRfYnVmZmVyX2NyZWF0ZShz
dHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1Cj4g
PiA+ID4gICAgICAgZHVtYl9hcmdzLndpZHRoID0gd2lkdGg7Cj4gPiA+ID4gICAgICAgZHVtYl9h
cmdzLmhlaWdodCA9IGhlaWdodDsKPiA+ID4gPiAgICAgICBkdW1iX2FyZ3MuYnBwID0gaW5mby0+
Y3BwWzBdICogODsKPiA+ID4gPiArICAgICBkdW1iX2FyZ3MuZmxhZ3MgPSBEUk1fTU9ERV9EVU1C
X0tFUk5FTF9NQVA7Cj4gPiA+ID4gICAgICAgcmV0ID0gZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2
LCAmZHVtYl9hcmdzLCBjbGllbnQtPmZpbGUpOwo+ID4gPiA+ICAgICAgIGlmIChyZXQpCj4gPiA+
ID4gICAgICAgICAgICAgICBnb3RvIGVycl9kZWxldGU7Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1
bWJfYnVmZmVycy5jCj4gPiA+ID4gaW5kZXggZDE4YTc0MGZlMGYxLi43NGExM2YxNGMxNzMgMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKPiA+ID4gPiBAQCAt
OTcsNyArOTcsMTAgQEAgaW50IGRybV9tb2RlX2NyZWF0ZV9kdW1iKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsCj4gPiA+ID4gIGludCBkcm1fbW9kZV9jcmVhdGVfZHVtYl9pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
ZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpCj4gPiA+ID4gIHsKPiA+ID4gPiAtICAg
ICByZXR1cm4gZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2LCBkYXRhLCBmaWxlX3ByaXYpOwo+ID4g
PiA+ICsgICAgIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAqYXJncyA9IGRhdGE7Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgIGFyZ3MtPmZsYWdzID0gMDsKPiA+ID4KPiA+ID4gSSB3b3VsZCBw
cmVmZXIgcmV0dXJuaW5nIGFuIGVycm9yIGlmIGZsYWdzIGlzIHNldCB0byBhIG5vbi16ZXJvIHZh
bHVlLAo+ID4gPiB0byBjYXRjaCB1c2Vyc3BhY2UgZXJyb3JzIGVhcmx5LCBidXQgSSdtIGFsc28g
d29ycmllZCBpdCB3b3VsZCBicmVhawo+ID4gPiBleGlzdGluZyB1c2Vyc3BhY2UgYnkgdW5jb3Zl
cmluZyBleGlzdGluZyBidWdzLiBTdGlsbCwgaWYgd2UgbGF0ZXIgYWRkCj4gPiA+IGZsYWdzIHRo
YXQgdXNlcnNwYWNlIGNhbiBzZXQsIHRob3NlIGV4aXN0aW5nIGJ1Z3Mgd2lsbCBiZSB0cmlnZ2Vy
ZWQsIHNvCj4gPiA+IHdlJ2xsIGhhdmUgdG8gZGVhbCB3aXRoIHRoZW0gYW55d2F5LCBhbmQgd2Ug
Y291bGQgYWxyZWFkeSBnaXZlIGl0IGEgdHJ5Lgo+ID4KPiA+IEkgd291bGQgbGlrZSB0aGF0IHRv
bywgYnV0IHRoZSBjb21tZW50IGp1c3QgYWJvdmUgdGhpcyBjb2RlIHRlbGxzIG1lCj4gPiB0aGF0
J3MgbGlrZWx5IHRvIGJyZWFrIHRoaW5nczoKPiA+Cj4gPiAgICAgICAgIC8qCj4gPiAgICAgICAg
ICAqIGhhbmRsZSwgcGl0Y2ggYW5kIHNpemUgYXJlIG91dHB1dCBwYXJhbWV0ZXJzLiBaZXJvIHRo
ZW0gb3V0IHRvCj4gPiAgICAgICAgICAqIHByZXZlbnQgZHJpdmVycyBmcm9tIGFjY2lkZW50YWxs
eSB1c2luZyB1bmluaXRpYWxpemVkIGRhdGEuIFNpbmNlCj4gPiAgICAgICAgICAqIG5vdCBhbGwg
ZXhpc3RpbmcgdXNlcnNwYWNlIGlzIGNsZWFyaW5nIHRoZXNlIGZpZWxkcyBwcm9wZXJseSB3ZQo+
ID4gICAgICAgICAgKiBjYW5ub3QgcmVqZWN0IElPQ1RMIHdpdGggZ2FyYmFnZSBpbiB0aGVtLgo+
ID4gICAgICAgICAgKi8KPiA+Cj4gPiBNYXliZSB1c2Vyc3BhY2UgZG9lcyBjb3JyZWN0bHkgemVy
byBvdXQgaW5wdXQgcGFyYW1zLgo+Cj4gQnV0IGlmIHRoYXQgaG9sZHMgdHJ1ZSwgaXQgbWVhbnMg
dGhhdCB3ZSB3aWxsIG5ldmVyIGJlIGFibGUgdG8gYWRkCj4gdXNlcnNwYWNlIGZsYWdzLCBhcyBk
b2luZyBzbyBjb3VsZCBicmVhayBhcHBsaWNhdGlvbnMgZm9yIHRoZSBzYW1lCj4gcmVhc29uLiBU
aGUgZmxhZyBmaWVsZCBzaG91bGQgdGh1cyBiZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBmb3IgdXNl
cnNwYWNlCj4gdXNhZ2UuIEkgd29uZGVyIGhvdyBiaWcgdGhlIHJpc2sgaXMuCgpHb29kIHBvaW50
LiBJIGd1ZXNzIGFub3RoZXIgb3B0aW9uIGlzIGFkZCBhIFdBUk4oZmxhZ3MgIT0gMCkgYW5kIHNl
ZQp3aGF0IGhhcHBlbnMuCgpUaGUgY29tbWl0IGFkZGluZyB0aGUgY29tbWVudCB3YXMgZjYwODU5
NTIyYTgzICgiZHJtOiBTYW5pdGl6ZQpEUk1fSU9DVExfTU9ERV9DUkVBVEVfRFVNQiBpbnB1dCIp
LiBNYXliZSBUaGllcnJ5IGhhcyBzb21lIGNvbW1lbnQ/CgpSb2IKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
