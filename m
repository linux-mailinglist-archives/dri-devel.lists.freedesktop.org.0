Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE11C240A
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A92D6ED9B;
	Sat,  2 May 2020 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0DF6ECBE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 14:59:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 3C1082A30D9
Subject: Re: [PATCH v3 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
 <20200417150614.2631786-8-enric.balletbo@collabora.com>
 <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <0584a198-02f2-a8a3-676e-74365a697bd4@collabora.com>
Date: Fri, 1 May 2020 16:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2h1bi1LdWFuZywKClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCgpPbiAxLzUvMjAgMTY6
MjYsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gSGksIEVucmljOgo+IAo+IEVucmljIEJhbGxldGJv
IGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+IOaWvCAyMDIw5bm0NOaciDE3
5pelIOmAseS6lCDkuIvljYgxMTowNuWvq+mBk++8mgo+Pgo+PiBVc2UgdGhlIGRybV9icmlkZ2Vf
Y29ubmVjdG9yIGhlbHBlciB0byBjcmVhdGUgYSBjb25uZWN0b3IgZm9yIHBpcGVsaW5lcwo+PiB0
aGF0IHVzZSBkcm1fYnJpZGdlLiBUaGlzIGFsbG93cyBzcGxpdHRpbmcgY29ubmVjdG9yIG9wZXJh
dGlvbnMgYWNyb3NzCj4+IG11bHRpcGxlIGJyaWRnZXMgd2hlbiBuZWNlc3NhcnksIGluc3RlYWQg
b2YgaGF2aW5nIHRoZSBsYXN0IGJyaWRnZSBpbgo+PiB0aGUgY2hhaW4gY3JlYXRpbmcgdGhlIGNv
bm5lY3RvciBhbmQgaGFuZGxpbmcgYWxsIGNvbm5lY3RvciBvcGVyYXRpb25zCj4+IGludGVybmFs
bHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiAtIE1v
dmUgdGhlIGJyaWRnZS50eXBlIGxpbmUgdG8gdGhlIHBhdGNoIHRoYXQgYWRkcyBkcm1fYnJpZGdl
IHN1cHBvcnQuIChMYXVyZW50IFBpbmNoYXJ0KQo+Pgo+PiBDaGFuZ2VzIGluIHYyOiBOb25lCj4+
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTMgKysrKysrKysrKysr
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4+IGluZGV4IDE1NzA5N2M2M2IyMy4uODVm
NzZiMDFhZTRkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPj4gQEAgLTE3
LDYgKzE3LDcgQEAKPj4KPj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+PiArI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdl
X2Nvbm5lY3Rvci5oPgo+PiAgI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KPj4gICNpbmNs
dWRlIDxkcm0vZHJtX29mLmg+Cj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgo+PiBAQCAt
MTgzLDYgKzE4NCw3IEBAIHN0cnVjdCBtdGtfZHNpIHsKPj4gICAgICAgICBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgZW5jb2RlcjsKPj4gICAgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7Cj4+ICAg
ICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdlOwo+PiArICAgICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4+ICAgICAgICAgc3RydWN0IHBoeSAqcGh5Owo+Pgo+
PiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPj4gQEAgLTk3NywxMCArOTc5LDE5IEBAIHN0
YXRpYyBpbnQgbXRrX2RzaV9lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3Ry
dWN0IG10a19kc2kgKmRzaSkKPj4gICAgICAgICAgKi8KPj4gICAgICAgICBkc2ktPmVuY29kZXIu
cG9zc2libGVfY3J0Y3MgPSAxOwo+Pgo+PiAtICAgICAgIHJldCA9IGRybV9icmlkZ2VfYXR0YWNo
KCZkc2ktPmVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCwgMCk7Cj4+ICsgICAgICAgcmV0ID0g
ZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5F
Q1RPUik7Cj4+ICAgICAgICAgaWYgKHJldCkKPj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Ns
ZWFudXBfZW5jb2RlcjsKPj4KPj4gKyAgICAgICBkc2ktPmNvbm5lY3RvciA9IGRybV9icmlkZ2Vf
Y29ubmVjdG9yX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVyKTsKPj4gKyAgICAgICBpZiAoSVNfRVJS
KGRzaS0+Y29ubmVjdG9yKSkgewo+PiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUg
dG8gY3JlYXRlIGJyaWRnZSBjb25uZWN0b3JcbiIpOwo+PiArICAgICAgICAgICAgICAgcmV0ID0g
UFRSX0VSUihkc2ktPmNvbm5lY3Rvcik7Cj4+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVh
bnVwX2VuY29kZXI7Cj4+ICsgICAgICAgfQo+PiArICAgICAgIGRybV9jb25uZWN0b3JfYXR0YWNo
X2VuY29kZXIoZHNpLT5jb25uZWN0b3IsICZkc2ktPmVuY29kZXIpOwo+PiArCj4gCj4gSSdtIG5v
dCB2ZXJ5IGNsZWFyIGFib3V0IGhvdyBicmlnZS1jb25uZWN0b3Igd29ya3MsIGJ1dCB3aHkgY29u
bmVjdG9yCj4gZG9lcyBub3QgYXR0YWNoIHRvIHBhbmVsPwo+IAoKTGF1cmVudCBvciBvdGhlciBk
cm0gbWFpbnRhaW5lcnMgbWlnaHQgaGF2ZSBtb3JlIGRldGFpbHMgdGhhbiBtZSwgYnV0LCBBRkFJ
SyB0aGUKZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCBpbml0aWFsaXplcyBhIGNvbm5lY3RvciBm
b3IgYSBjaGFpbiBvZiBicmlkZ2VzIHRoYXQKc3RhcnRzIGF0IHRoZSBAZW5jb2Rlci4gQXQgdGhp
cyBwb2ludCB5b3UgZG9uJ3Qga25vdyB3aGljaCBicmlkZ2UgaXMgY29ubmVjdGVkCnRvIHRoZSBw
YW5lbCBwaHlzaWNhbGx5IGJ1dCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgYXMgd2hhdCB5b3Uga25v
dyBpcyB0aGF0IHdpbGwKYmUgb25seSBvbmUgY29ubmVjdG9yIGluIHRoZSAgY2hhaW4uCgpUaGFu
a3MsCiBFbnJpYwoKPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4gCj4+ICAgICAgICAgcmV0dXJu
IDA7Cj4+Cj4+ICBlcnJfY2xlYW51cF9lbmNvZGVyOgo+PiAtLQo+PiAyLjI1LjEKPj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
