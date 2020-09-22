Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E22274455
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0446E87D;
	Tue, 22 Sep 2020 14:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D9E6E8A0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:28:56 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id b123so10388966vsd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xiJbBWY7GN3rzUo18IIJnpV2ghi6xsqnbKYIJkljEwk=;
 b=Nzh7/rbmd0cv4lSWLCA7+3fhrYYbrMLONY9YMM84fmOmrHGfKW1RmdMRK1G8uhGleb
 /670EmvmAz1RiInZm4g6bFGp/V+K9ZHOYN1a8K4AOBpE8yDTeD3Od2ERuxt+X4Mehd3f
 dBitoX8V31IAGnup2uvCz9fXdxLehT5Uuhqaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xiJbBWY7GN3rzUo18IIJnpV2ghi6xsqnbKYIJkljEwk=;
 b=mjQ6X5AzwPp6cX3P9hsVR+JZd1sCJMuLm59NXARhYSd06oCq2WQiTTLjDRHGwJxbW+
 Na290RM0JwMkRgU2wMEhXKCFoVlIjNy3ArSxdqFDIhtrallp/dAEd5nEyoJ/FP+43tEc
 iI0I9m9EbZHGgHrjtIMyhxaFFHd2UotRTo2a/WrASsS9c5yy5l3KykQf0nSUrLm3DSd3
 lxJ9kQBEaVvdpbAPF+wnTEsbI3eY+X9l/S4boGMNWIGvcCstq6i/uVPsDLwqGobjT1HZ
 4M4YmMImCe/EhZqnOfrv75tkDCcjiyytOu4LzsLTv1JpfENWScmQ8LHXI/YPECYjATQC
 Latg==
X-Gm-Message-State: AOAM531deDjPwJpdpHtvYuG5t3L8ZpZppilUr3bBUAYnfx2XE6uwlBha
 yHn1/kzoIsk0Lpszvb5/MzdX9nn+gfizwA==
X-Google-Smtp-Source: ABdhPJz8jKVhrnsgow9Q9ZjZUi6xIrQl50/hjyL7o63Be66Bj+gC4jAGU20FObBICVCkIDovuKMbhA==
X-Received: by 2002:a67:e3aa:: with SMTP id j10mr3484009vsm.51.1600784934784; 
 Tue, 22 Sep 2020 07:28:54 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id r17sm1022897vsf.25.2020.09.22.07.28.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 07:28:53 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id w25so1048179vsk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:28:53 -0700 (PDT)
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr3637258vsp.34.1600784933251; 
 Tue, 22 Sep 2020 07:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200921181803.1160-1-vicencb@gmail.com>
 <20200921181803.1160-2-vicencb@gmail.com>
 <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
 <1ada2daf-16f3-191f-ccc1-d3d7d0c319fc@rock-chips.com>
 <CAAMcf8Az5AVWNzMHuxXda5WUm4_E5QCwpgb2fVtaT0w2+cQELw@mail.gmail.com>
 <bd2d67ee-4023-ccde-3b2a-e88c3e076d12@rock-chips.com>
In-Reply-To: <bd2d67ee-4023-ccde-3b2a-e88c3e076d12@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Sep 2020 07:28:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xv+CZhvXc583VTR2HpSEtkpho3aV5qG5_1-tKFgw_vaQ@mail.gmail.com>
Message-ID: <CAD=FV=Xv+CZhvXc583VTR2HpSEtkpho3aV5qG5_1-tKFgw_vaQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzNdIGRybTogcm9ja2NoaXA6IGhkbWk6IHJlbW92ZSB2b3BfY3J0Yw==?=
 =?UTF-8?B?X21vZGVfZml4dXAgdG8gZml4IGNsb2NrIGhhbmRsaW5n44CQ6K+35rOo5oSP77yM6YKu5Lu255SxbGlu?=
 =?UTF-8?B?dXgtcm9ja2NoaXAtYm91bmNlcythbmR5Lnlhbj1yb2NrLWNoaXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQu?=
 =?UTF-8?B?b3Jn5Luj5Y+R44CR?=
To: crj <algea.cao@rock-chips.com>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 Vicente Bergas <vicencb@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCAzOjEzIEFNIGNyaiA8YWxnZWEuY2FvQHJvY2st
Y2hpcHMuY29tPiB3cm90ZToKPgo+IEhpLCBEb3VnbGFzCj4KPiDlnKggMjAyMC85LzIyIDE3OjMx
LCBWaWNlbnRlIEJlcmdhcyDlhpnpgZM6Cj4gPiBPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCAxMToy
NCBBTSBjcmogPGFsZ2VhLmNhb0Byb2NrLWNoaXBzLmNvbT4gd3JvdGU6Cj4gPj4gSGVsbG8gVmlj
ZW50ZSwKPiA+Pgo+ID4+IOWcqCAyMDIwLzkvMjIgMTU6NDAsIEFuZHkgWWFuIOWGmemBkzoKPiA+
Pj4gQWRkIG91ciBIRE1JIGRyaXZlciBvd25lciBBbGdlYSB0byBsaXN0Lgo+ID4+Pgo+ID4+PiBP
biA5LzIyLzIwIDI6MTggQU0sIFZpY2VudGUgQmVyZ2FzIHdyb3RlOgo+ID4+Pj4gVW5kZXIgY2Vy
dGFpbiBjb25kaXRpb25zIHZvcF9jcnRjX21vZGVfZml4dXAgcm91bmRzIHRoZSBjbG9jawo+ID4+
Cj4gPj4gTWF5IEkgYXNrIHVuZGVyIHdoYXQgY29uZGl0aW9ucyB0aGF0IHRoZSBjbG9jayBvZiBI
RE1JIHdpbGwKPiA+Pgo+ID4+IGJlIGNoYW5nZWQgdG8gMTQ4NTAxMDAwPyAgSW4gZ2VuZXJhbCwg
dGhlIGRlc2NyaXB0aW9uIG9mIGNsb2NrCj4gPj4KPiA+PiBpbiBFRElEIHdpbGwgbm90IGJlIGRl
dGFpbGVkIGJlbG93IHRoZSB0aG91c2FuZHMgcGxhY2UuCj4gPiBUaGVyZSBpcyBubyBjbG9jayBp
biB0aGUgRURJRCB3aXRoIDFLSHogcmVzb2x1dGlvbiwgdGhlIGNsb2NrIGlzCj4gPiAxNDg1MDAw
MDAgd2hpY2ggaGFzIDUwMEtIeiByZXNvbHV0aW9uLgo+ID4gSXQgaXMgdGhlIGZ1bmN0aW9uIHZv
cF9jcnRjX21vZGVfZml4dXAgdGhhdCBnZXRzIHh4eDAwMDAgYW5kIHJldHVybnMgeHh4MTAwMAo+
Cj4gSSBjaGVja2VkIHRoZSBjb21taXQgbXNnIG9mIGNvbW1pdCAyODc0MjJhOTVmZTIgKCJkcm0v
cm9ja2NoaXA6IFJvdW5kIHVwCj4gX2JlZm9yZV8gZ2l2aW5nIHRvIHRoZSBjbG9jayBmcmFtZXdv
cmsiKS4KPgo+IFJvdW5kIHVwIGhkbWkgY2xvY2sgaXMgZm9yIHNvbWUgcGFuZWxzIHdpdGggc3Bl
Y2lhbCBjbG9ja3MuICBBcmUgdGhlc2UKPiBwYW5lbHMgY2xvY2sgY2FuJ3QgYmUgZGl2aWRlZCBj
b3JyZWN0bHkgY29tbW9uPwoKSSdtIHNvcnJ5LCBidXQgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBx
dWVzdGlvbi4gIENhbiB5b3UgcmVzdGF0ZT8gIEkKdGhpbmsgdGhlIGNvbW1pdCBtZXNzYWdlIHRo
YXQgeW91IHJlZmVyIHRvIGlzIHByZXR0eSB0aG9yb3VnaC4KU3BlY2lmaWNhbGx5IHRoZSBwcm9i
bGVtIGlzIGFsbCBhcm91bmQgdGhlIGZhY3QgdGhhdCwgaW50ZXJuYWxseSwgRFJNCm9mdGVuIHJl
ZmVycyB0byBjbG9ja3MgaW4ga0h6LiAgV2UgZW5kIHVwIHdpdGggaXNzdWVzIHdoZW4gY29udmVy
dGluZwpiYWNrIGFuZCBmb3J0aCBiZXR3ZWVuIG51bWJlcnMgaW4ga0h6IGFuZCBpbiBNSHouICBT
aW5jZSBEUk0gYWx3YXlzCnJvdW5kcyBkb3duIHdoZW4gZ29pbmcgdG8ga0h6IHdlIGVuZCB1cCB3
aXRoIHByb2JsZW1zLgoKSSdtIGN1cmlvdXMgaG93IHlvdSdyZSBlbmRpbmcgdXAgd2l0aCBhbiBl
cnJvciwgdGhvdWdoLiAgSG93IGNvdWxkCmFkZGluZyA5OTkgdG8gMTQ4NTAwMDAwIGFuZCB0aGVu
IHJvdW5kaW5nIGRvd24gY2F1c2UgeW91IHRvIGdldAoxNDg1MDEwMDA/CgoKPiA+Pj4+IDE0ODUw
MDAwMCB0byAxNDg1MDEwMDAgd2hpY2ggbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBlcnJvcjoKPiA+
Pj4+IGR3aGRtaS1yb2NrY2hpcCBmZjk0MDAwMC5oZG1pOiBQSFkgY29uZmlndXJhdGlvbiBmYWls
ZWQgKGNsb2NrCj4gPj4+PiAxNDg1MDEwMDApCj4gPj4+Pgo+ID4+Pj4gVGhlIGlzc3VlIHdhcyBm
b3VuZCBvbiBSSzMzOTkgYm9vdGluZyB3aXRoIHUtYm9vdC4gVS1ib290IGNvbmZpZ3VyZXMgdGhl
Cj4gPj4+PiBkaXNwbGF5IGF0IDI1NjB4MTQ0MCBhbmQgdGhlbiBsaW51eCBjb21lcyB1cCB3aXRo
IGEgYmxhY2sgc2NyZWVuLgo+ID4+Pj4gQSB3b3JrYXJvdW5kIHdhcyB0byB1bi1wbHVnIGFuZCBy
ZS1wbHVnIHRoZSBIRE1JIGRpc3BsYXkuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogVmlj
ZW50ZSBCZXJnYXMgPHZpY2VuY2JAZ21haWwuY29tPgo+ID4+Pj4gVGVzdGVkLWJ5OiBWaWNlbnRl
IEJlcmdhcyA8dmljZW5jYkBnbWFpbC5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCA0NSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0NSBkZWxldGlvbnMoLSkKPiA+Pj4+Cj4g
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92
b3AuYwo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5j
Cj4gPj4+PiBpbmRleCBjODBmN2Q5ZmQxM2YuLmZlODBkYTY1Mjk5NCAxMDA2NDQKPiA+Pj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPiA+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPiA+Pj4+IEBA
IC0xMTQyLDUwICsxMTQyLDYgQEAgc3RhdGljIHZvaWQgdm9wX2NydGNfZGlzYWJsZV92Ymxhbmso
c3RydWN0Cj4gPj4+PiBkcm1fY3J0YyAqY3J0YykKPiA+Pj4+ICAgICAgICBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZ2b3AtPmlycV9sb2NrLCBmbGFncyk7Cj4gPj4+PiAgICB9Cj4gPj4+PiAgICAt
c3RhdGljIGJvb2wgdm9wX2NydGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4g
Pj4+PiAtICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2Rl
LAo+ID4+Pj4gLSAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0
ZWRfbW9kZSkKPiA+Pj4+IC17Cj4gPj4+PiAtICAgIHN0cnVjdCB2b3AgKnZvcCA9IHRvX3ZvcChj
cnRjKTsKPiA+Pj4+IC0gICAgdW5zaWduZWQgbG9uZyByYXRlOwo+ID4+Pj4gLQo+ID4+Pj4gLSAg
ICAvKgo+ID4+Pj4gLSAgICAgKiBDbG9jayBjcmF6aW5lc3MuCj4gPj4+PiAtICAgICAqCj4gPj4+
PiAtICAgICAqIEtleSBwb2ludHM6Cj4gPj4+PiAtICAgICAqCj4gPj4+PiAtICAgICAqIC0gRFJN
IHdvcmtzIGluIGluIGtIei4KPiA+Pj4+IC0gICAgICogLSBDbG9jayBmcmFtZXdvcmsgd29ya3Mg
aW4gSHouCj4gPj4+PiAtICAgICAqIC0gUm9ja2NoaXAncyBjbG9jayBkcml2ZXIgcGlja3MgdGhl
IGNsb2NrIHJhdGUgdGhhdCBpcyB0aGUKPiA+Pj4+IC0gICAgICogICBzYW1lIF9PUiBMT1dFUl8g
dGhhbiB0aGUgb25lIHJlcXVlc3RlZC4KPiA+Pj4+IC0gICAgICoKPiA+Pj4+IC0gICAgICogQWN0
aW9uIHBsYW46Cj4gPj4+PiAtICAgICAqCj4gPj4+PiAtICAgICAqIDEuIFdoZW4gRFJNIGdpdmVz
IHVzIGEgbW9kZSwgd2Ugc2hvdWxkIGFkZCA5OTkgSHogdG8gaXQuCj4gPj4+PiBUaGF0IHdheQo+
ID4+Pj4gLSAgICAgKiAgICBpZiB0aGUgY2xvY2sgd2UgbmVlZCBpcyA2MDAwMDAwMSBIeiAofjYw
IE1IeikgYW5kIERSTQo+ID4+Pj4gdGVsbHMgdXMgdG8KPiA+Pj4+IC0gICAgICogICAgbWFrZSA2
MDAwMCBrSHogdGhlbiB0aGUgY2xvY2sgZnJhbWV3b3JrIHdpbGwgYWN0dWFsbHkgZ2l2ZSB1cwo+
ID4+Pj4gLSAgICAgKiAgICB0aGUgcmlnaHQgY2xvY2suCj4gPj4+PiAtICAgICAqCj4gPj4+PiAt
ICAgICAqICAgIE5PVEU6IGlmIHRoZSBQTEwgKG1heWJlIHRocm91Z2ggYSBkaXZpZGVyKSBjb3Vs
ZCBhY3R1YWxseQo+ID4+Pj4gbWFrZQo+ID4+Pj4gLSAgICAgKiAgICBhIGNsb2NrIHJhdGUgOTk5
IEh6IGhpZ2hlciBpbnN0ZWFkIG9mIHRoZSBvbmUgd2Ugd2FudCB0aGVuCj4gPj4+PiB0aGlzCj4g
Pj4+PiAtICAgICAqICAgIGNvdWxkIGJlIGEgcHJvYmxlbS4gIFVuZm9ydHVuYXRlbHkgdGhlcmUn
cyBub3QgbXVjaCB3ZSBjYW4gZG8KPiA+Pj4+IC0gICAgICogICAgc2luY2UgaXQncyBiYWtlZCBp
bnRvIERSTSB0byB1c2Uga0h6LiAgSXQgc2hvdWxkbid0IG1hdHRlciBpbgo+ID4+Pj4gLSAgICAg
KiAgICBwcmFjdGljZSBzaW5jZSBSb2NrY2hpcCBQTExzIGFyZSBjb250cm9sbGVkIGJ5IHRhYmxl
cyBhbmQKPiA+Pj4+IC0gICAgICogICAgZXZlbiBpZiB0aGVyZSBpcyBhIGRpdmlkZXIgaW4gdGhl
IG1pZGRsZSBJIHdvdWxkbid0IGV4cGVjdAo+ID4+Pj4gUExMCj4gPj4+PiAtICAgICAqICAgIHJh
dGVzIGluIHRoZSB0YWJsZSB0aGF0IGFyZSBqdXN0IGEgZmV3IGtIeiBkaWZmZXJlbnQuCj4gPj4+
PiAtICAgICAqCj4gPj4+PiAtICAgICAqIDIuIEdldCB0aGUgY2xvY2sgZnJhbWV3b3JrIHRvIHJv
dW5kIHRoZSByYXRlIGZvciB1cyB0byB0ZWxsIHVzCj4gPj4+PiAtICAgICAqICAgIHdoYXQgaXQg
d2lsbCBhY3R1YWxseSBtYWtlLgo+ID4+Pj4gLSAgICAgKgo+ID4+Pj4gLSAgICAgKiAzLiBTdG9y
ZSB0aGUgcm91bmRlZCB1cCByYXRlIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byB3b3JyeQo+ID4+
Pj4gYWJvdXQKPiA+Pj4+IC0gICAgICogICAgdGhpcyBpbiB0aGUgYWN0dWFsIGNsa19zZXRfcmF0
ZSgpLgo+ID4+Pj4gLSAgICAgKi8KPiA+Pj4+IC0gICAgcmF0ZSA9IGNsa19yb3VuZF9yYXRlKHZv
cC0+ZGNsaywgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgKiAxMDAwICsKPiA+Pj4+IDk5OSk7Cj4gPj4+
PiAtICAgIGFkanVzdGVkX21vZGUtPmNsb2NrID0gRElWX1JPVU5EX1VQKHJhdGUsIDEwMDApOwo+
ID4+Pj4gLQo+ID4+Pj4gLSAgICByZXR1cm4gdHJ1ZTsKPiA+Pj4+IC19Cj4gPj4+PiAtCj4gPj4+
PiAgICBzdGF0aWMgYm9vbCB2b3BfZHNwX2x1dF9pc19lbmFibGVkKHN0cnVjdCB2b3AgKnZvcCkK
PiA+Pj4+ICAgIHsKPiA+Pj4+ICAgICAgICByZXR1cm4gdm9wX3JlYWRfcmVnKHZvcCwgMCwgJnZv
cC0+ZGF0YS0+Y29tbW9uLT5kc3BfbHV0X2VuKTsKPiA+Pj4+IEBAIC0xNTEyLDcgKzE0NjgsNiBA
QCBzdGF0aWMgdm9pZCB2b3BfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0Cj4gPj4+PiBkcm1fY3J0
YyAqY3J0YywKPiA+Pj4+ICAgIH0KPiA+Pj4+ICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Y3J0Y19oZWxwZXJfZnVuY3Mgdm9wX2NydGNfaGVscGVyX2Z1bmNzID0gewo+ID4+Pj4gLSAgICAu
bW9kZV9maXh1cCA9IHZvcF9jcnRjX21vZGVfZml4dXAsCj4gPj4+PiAgICAgICAgLmF0b21pY19j
aGVjayA9IHZvcF9jcnRjX2F0b21pY19jaGVjaywKPiA+Pj4+ICAgICAgICAuYXRvbWljX2JlZ2lu
ID0gdm9wX2NydGNfYXRvbWljX2JlZ2luLAo+ID4+Pj4gICAgICAgIC5hdG9taWNfZmx1c2ggPSB2
b3BfY3J0Y19hdG9taWNfZmx1c2gsCj4gPgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
