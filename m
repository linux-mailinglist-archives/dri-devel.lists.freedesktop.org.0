Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E111C222B
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 03:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F9489BF8;
	Sat,  2 May 2020 01:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D31E89BF8
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 01:54:29 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A53021924
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 01:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588384468;
 bh=uY8fEHgTBnpO8fsoxZlDnMux6T26lJUIhugrBr31N6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lJ5ds4TttwcpUROIM02Abch8q9cYzIApIjH5H7FzrkOfsEFG+JygEY2PuwABm6cvn
 FJaYdq0EAVE6omje0vk8O3jjQr9jdMUBg8yfzhPe1JMcpXtpzquRSldL3dESw8AGsp
 r5Ce54XMyml1bB9Wcvs0d/naEeSfmZngKFQqOSkg=
Received: by mail-ed1-f45.google.com with SMTP id j20so8690226edj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 18:54:28 -0700 (PDT)
X-Gm-Message-State: AGi0PuaZToZ/96TDbOX1JukVV4/V7w3qoPjpibqfcN1+UWyX5+VChwGt
 1x1aLySdA0EYgD5hWpyGIrj9I+5jzp6FjJIf0Q==
X-Google-Smtp-Source: APiQypIS+1NERldYNzLF5tD3POttq+/wUdUvXB9NBGGdtW+fUkc/vmloe1jVIGuZx6UIhOyurmUOKZuUiQtKW1FC/Nk=
X-Received: by 2002:a50:ea87:: with SMTP id d7mr5761934edo.48.1588384466454;
 Fri, 01 May 2020 18:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
 <20200417150614.2631786-8-enric.balletbo@collabora.com>
 <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
 <0584a198-02f2-a8a3-676e-74365a697bd4@collabora.com>
In-Reply-To: <0584a198-02f2-a8a3-676e-74365a697bd4@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 2 May 2020 09:54:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__UWdXMYxeYNLOEiTX+-wWuRU_xuXy9SkPToerH+=mveA@mail.gmail.com>
Message-ID: <CAAOTY__UWdXMYxeYNLOEiTX+-wWuRU_xuXy9SkPToerH+=mveA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
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

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyIMeaXpSDpgLHkupQg5LiL5Y2IMTA6NTnlr6vpgZPvvJoK
Pgo+IEhpIENodW4tS3VhbmcsCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lgo+Cj4gT24g
MS81LzIwIDE2OjI2LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIEVucmljOgo+ID4KPiA+
IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+IOaW
vCAyMDIw5bm0NOaciDE35pelIOmAseS6lCDkuIvljYgxMTowNuWvq+mBk++8mgo+ID4+Cj4gPj4g
VXNlIHRoZSBkcm1fYnJpZGdlX2Nvbm5lY3RvciBoZWxwZXIgdG8gY3JlYXRlIGEgY29ubmVjdG9y
IGZvciBwaXBlbGluZXMKPiA+PiB0aGF0IHVzZSBkcm1fYnJpZGdlLiBUaGlzIGFsbG93cyBzcGxp
dHRpbmcgY29ubmVjdG9yIG9wZXJhdGlvbnMgYWNyb3NzCj4gPj4gbXVsdGlwbGUgYnJpZGdlcyB3
aGVuIG5lY2Vzc2FyeSwgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGxhc3QgYnJpZGdlIGluCj4gPj4g
dGhlIGNoYWluIGNyZWF0aW5nIHRoZSBjb25uZWN0b3IgYW5kIGhhbmRsaW5nIGFsbCBjb25uZWN0
b3Igb3BlcmF0aW9ucwo+ID4+IGludGVybmFsbHkuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBF
bnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+ID4+
IC0tLQo+ID4+Cj4gPj4gQ2hhbmdlcyBpbiB2MzoKPiA+PiAtIE1vdmUgdGhlIGJyaWRnZS50eXBl
IGxpbmUgdG8gdGhlIHBhdGNoIHRoYXQgYWRkcyBkcm1fYnJpZGdlIHN1cHBvcnQuIChMYXVyZW50
IFBpbmNoYXJ0KQo+ID4+Cj4gPj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+ID4+Cj4gPj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMyArKysrKysrKysrKystCj4gPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+PiBpbmRleCAxNTcwOTdjNjNiMjMuLjg1Zjc2
YjAxYWU0ZCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4+IEBA
IC0xNyw2ICsxNyw3IEBACj4gPj4KPiA+PiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBl
ci5oPgo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KPiA+PiArI2luY2x1ZGUgPGRy
bS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5oPgo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9taXBpX2Rz
aS5oPgo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgo+ID4+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9wYW5lbC5oPgo+ID4+IEBAIC0xODMsNiArMTg0LDcgQEAgc3RydWN0IG10a19kc2kgewo+ID4+
ICAgICAgICAgc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXI7Cj4gPj4gICAgICAgICBzdHJ1Y3Qg
ZHJtX2JyaWRnZSBicmlkZ2U7Cj4gPj4gICAgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4dF9i
cmlkZ2U7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ID4+
ICAgICAgICAgc3RydWN0IHBoeSAqcGh5Owo+ID4+Cj4gPj4gICAgICAgICB2b2lkIF9faW9tZW0g
KnJlZ3M7Cj4gPj4gQEAgLTk3NywxMCArOTc5LDE5IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9lbmNv
ZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IG10a19kc2kgKmRzaSkKPiA+
PiAgICAgICAgICAqLwo+ID4+ICAgICAgICAgZHNpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0g
MTsKPiA+Pgo+ID4+IC0gICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2Rl
ciwgJmRzaS0+YnJpZGdlLCBOVUxMLCAwKTsKPiA+PiArICAgICAgIHJldCA9IGRybV9icmlkZ2Vf
YXR0YWNoKCZkc2ktPmVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCwKPiA+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUik7Cj4g
Pj4gICAgICAgICBpZiAocmV0KQo+ID4+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVw
X2VuY29kZXI7Cj4gPj4KPiA+PiArICAgICAgIGRzaS0+Y29ubmVjdG9yID0gZHJtX2JyaWRnZV9j
b25uZWN0b3JfaW5pdChkcm0sICZkc2ktPmVuY29kZXIpOwo+ID4+ICsgICAgICAgaWYgKElTX0VS
Uihkc2ktPmNvbm5lY3RvcikpIHsKPiA+PiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFi
bGUgdG8gY3JlYXRlIGJyaWRnZSBjb25uZWN0b3JcbiIpOwo+ID4+ICsgICAgICAgICAgICAgICBy
ZXQgPSBQVFJfRVJSKGRzaS0+Y29ubmVjdG9yKTsKPiA+PiArICAgICAgICAgICAgICAgZ290byBl
cnJfY2xlYW51cF9lbmNvZGVyOwo+ID4+ICsgICAgICAgfQo+ID4+ICsgICAgICAgZHJtX2Nvbm5l
Y3Rvcl9hdHRhY2hfZW5jb2Rlcihkc2ktPmNvbm5lY3RvciwgJmRzaS0+ZW5jb2Rlcik7Cj4gPj4g
Kwo+ID4KPiA+IEknbSBub3QgdmVyeSBjbGVhciBhYm91dCBob3cgYnJpZ2UtY29ubmVjdG9yIHdv
cmtzLCBidXQgd2h5IGNvbm5lY3Rvcgo+ID4gZG9lcyBub3QgYXR0YWNoIHRvIHBhbmVsPwo+ID4K
Pgo+IExhdXJlbnQgb3Igb3RoZXIgZHJtIG1haW50YWluZXJzIG1pZ2h0IGhhdmUgbW9yZSBkZXRh
aWxzIHRoYW4gbWUsIGJ1dCwgQUZBSUsgdGhlCj4gZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCBp
bml0aWFsaXplcyBhIGNvbm5lY3RvciBmb3IgYSBjaGFpbiBvZiBicmlkZ2VzIHRoYXQKPiBzdGFy
dHMgYXQgdGhlIEBlbmNvZGVyLiBBdCB0aGlzIHBvaW50IHlvdSBkb24ndCBrbm93IHdoaWNoIGJy
aWRnZSBpcyBjb25uZWN0ZWQKPiB0byB0aGUgcGFuZWwgcGh5c2ljYWxseSBidXQgZG9lc24ndCBy
ZWFsbHkgbWF0dGVyIGFzIHdoYXQgeW91IGtub3cgaXMgdGhhdCB3aWxsCj4gYmUgb25seSBvbmUg
Y29ubmVjdG9yIGluIHRoZSAgY2hhaW4uCgpJIHRoaW5rIHRoZSBwYW5lbCBpcyB3cmFwcGVkIGlu
dG8gbmV4dF9icmlkZ2UgaGVyZSwKCmlmIChwYW5lbCkgewogICAgZHNpLT5uZXh0X2JyaWRnZSA9
IGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQoZGV2LCBwYW5lbCk7CgpzbyB0aGUgbmV4dF9icmlk
Z2UgaXMgYSBwYW5lbF9icmlkZ2UsIGluIGl0cyBhdHRhY2ggZnVuY3Rpb24KcGFuZWxfYnJpZGdl
X2F0dGFjaCgpLAphY2NvcmRpbmcgdG8gdGhlIGZsYWcgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09O
TkVDVE9SLCBpZiBub3QgZXhpc3QsCml0IHdvdWxkIGNyZWF0ZSBjb25uZWN0b3IgYW5kIGF0dGFj
aCBjb25uZWN0b3IgdG8gcGFuZWwuCgpJJ20gbm90IHN1cmUgdGhpcyBmbGFnIHdvdWxkIGV4aXN0
IG9yIG5vdCwgYnV0IGZvciBib3RoIGNhc2UsIGl0J3Mgc3RyYW5nZS4KSWYgZXhpc3QsIHlvdSBj
cmVhdGUgY29ubmVjdG9yIGluIHRoaXMgcGF0Y2ggYnV0IG5vIHdoZXJlIHRvIGF0dGFjaApjb25u
ZWN0b3IgdG8gcGFuZWwuCklmIG5vdCBleGlzdCwgdGhlIG5leHRfYnJpZ2Ugd291bGQgY3JlYXRl
IG9uZSBjb25uZWN0b3IgYW5kIHRoaXMgYnJpZ2UKd291bGQgY3JlYXRlIGFub3RoZXIgY29ubmVj
dG9yLgoKSSB0aGluayBpbiB5b3VyIGNhc2UsIG10a19kc2kgZG9lcyBub3QgZGlyZWN0bHkgY29u
bmVjdCB0byBhIHBhbmVsLCBzbwpJIG5lZWQgYSBleGFjdCBleHBsYWluLiBPciBzb21lb25lIGNv
dWxkIHRlc3QgdGhpcyBvbiBhCmRpcmVjdGx5LWNvbm5lY3QtcGFuZWwgcGxhdGZvcm0uCgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPgo+IFRoYW5rcywKPiAgRW5yaWMKPgo+ID4gUmVnYXJkcywKPiA+
IENodW4tS3VhbmcuCj4gPgo+ID4+ICAgICAgICAgcmV0dXJuIDA7Cj4gPj4KPiA+PiAgZXJyX2Ns
ZWFudXBfZW5jb2RlcjoKPiA+PiAtLQo+ID4+IDIuMjUuMQo+ID4+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
