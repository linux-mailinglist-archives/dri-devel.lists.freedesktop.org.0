Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1928DEE72
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 15:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD21B6E0E9;
	Mon, 21 Oct 2019 13:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757516E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 13:54:22 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC05881F19
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 13:54:21 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id v92so1271330qtd.18
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 06:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2G1xusxf4dns3pndHNTvCsxrH/ysqq3dgJVBnbwKIs=;
 b=r2+YpgRi7Oeh3tV6rtAm4liV/9EwlG7eXZpDnRSC5oRaUZUB7UZoB+IzE+jN3h2TkY
 SPNdQ76ZREZ8/KrxNN6HC3LbvE7R1xBtYHYjn5HHEom/1TB4SlesG3GWJJv7i2MrlKxi
 vL8BhtUANTQi56NvL8MrjLsLhoHrrc6ktdKT9a04lZfn4OziQbywVtKS83FqtXSI/Xgy
 wItZoCRu2KCPfES7J1j2sll7pviKoGIubITF6Tak5BnkzsXJ1bQcVWsiG7bBfPRIJ9YZ
 5z2IG/bX5snsEO9JF+mlGy4vgrGuaGcQbT4jJZz9yVCS6XEPp64S6BCHDD05ZmdPszSD
 YXbQ==
X-Gm-Message-State: APjAAAUA32II159zDss1r/XeOX65F7crUKvaqGHjNLaikEAeWdiLfwIh
 h5LCNGhV26kBoqzxOArVZyC8bej4vYq4Z5CiOxbyHzdyFZnG8MEIDfEPWEL95c2QNZpEo7u2eh0
 gsNTfrr93KXURVYdsfV6tuvCdDtke8Ut8T8SFZHPy/+AI
X-Received: by 2002:ac8:664b:: with SMTP id j11mr24827247qtp.137.1571666061243; 
 Mon, 21 Oct 2019 06:54:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkFGgGdHL5wN4wh/Zt1E39qBLM+0KoKUb4VD7Jy4sRN04D/L8vg7pR474/ZE01oLpPOfhqewZ/sebaQYyV838=
X-Received: by 2002:ac8:664b:: with SMTP id j11mr24827222qtp.137.1571666060943; 
 Mon, 21 Oct 2019 06:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
In-Reply-To: <20191021133328.GI2819@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Oct 2019 15:54:09 +0200
Message-ID: <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMzozMyBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTE6
NDg6MjJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTYsIDIw
MTkgYXQgMTE6MzcgUE0gQmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0BrZXJuZWwub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gWytjYyBsaW51eC1hY3BpXQo+ID4gPgo+ID4gPiBPbiBXZWQsIE9jdCAxNiwg
MjAxOSBhdCAwOToxODozMlBNICswMjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+ID4gYnV0
IHNldHRpbmcgdGhlIFBDSV9ERVZfRkxBR1NfTk9fRDMgZmxhZyBkb2VzIHByZXZlbnQgdXNpbmcg
dGhlCj4gPiA+ID4gcGxhdGZvcm0gbWVhbnMgb2YgcHV0dGluZyB0aGUgZGV2aWNlIGludG8gRDNj
b2xkLCByaWdodD8gVGhhdCdzCj4gPiA+ID4gYWN0dWFsbHkgd2hhdCBzaG91bGQgc3RpbGwgaGFw
cGVuLCBqdXN0IHRoZSBEM2hvdCBzdGVwIHNob3VsZCBiZQo+ID4gPiA+IHNraXBwZWQuCj4gPiA+
Cj4gPiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHdoZW4gd2UgcHV0IGEgZGV2aWNlIGlu
IEQzY29sZCBvbiBhbiBBQ1BJCj4gPiA+IHN5c3RlbSwgd2UgZG8gc29tZXRoaW5nIGxpa2UgdGhp
czoKPiA+ID4KPiA+ID4gICBwY2lfc2V0X3Bvd2VyX3N0YXRlKEQzY29sZCkKPiA+ID4gICAgIGlm
IChQQ0lfREVWX0ZMQUdTX05PX0QzKQo+ID4gPiAgICAgICByZXR1cm4gMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPC0tIG5vdGhpbmcgYXQgYWxsIGlmIHF1aXJrZWQKPiA+ID4g
ICAgIHBjaV9yYXdfc2V0X3Bvd2VyX3N0YXRlCj4gPiA+ICAgICAgIHBjaV93cml0ZV9jb25maWdf
d29yZChQQ0lfUE1fQ1RSTCwgRDNob3QpICA8LS0gc2V0IHRvIEQzaG90Cj4gPiA+ICAgICBfX3Bj
aV9jb21wbGV0ZV9wb3dlcl90cmFuc2l0aW9uKEQzY29sZCkKPiA+ID4gICAgICAgcGNpX3BsYXRm
b3JtX3Bvd2VyX3RyYW5zaXRpb24oRDNjb2xkKQo+ID4gPiAgICAgICAgIHBsYXRmb3JtX3BjaV9z
ZXRfcG93ZXJfc3RhdGUoRDNjb2xkKQo+ID4gPiAgICAgICAgICAgYWNwaV9wY2lfc2V0X3Bvd2Vy
X3N0YXRlKEQzY29sZCkKPiA+ID4gICAgICAgICAgICAgYWNwaV9kZXZpY2Vfc2V0X3Bvd2VyKEFD
UElfU1RBVEVfRDNfQ09MRCkKPiA+ID4gICAgICAgICAgICAgICAuLi4KPiA+ID4gICAgICAgICAg
ICAgICAgIGFjcGlfZXZhbHVhdGVfb2JqZWN0KCJfT0ZGIikgICAgIDwtLSBzZXQgdG8gRDNjb2xk
Cj4gPiA+Cj4gPiA+IEkgZGlkIG5vdCB1bmRlcnN0YW5kIHRoZSBjb25uZWN0aW9uIHdpdGggcGxh
dGZvcm0gKEFDUEkpIHBvd2VyCj4gPiA+IG1hbmFnZW1lbnQgZnJvbSB5b3VyIHBhdGNoLiAgSXQg
c291bmRzIGxpa2UgeW91IHdhbnQgdGhpcyBlbnRpcmUgcGF0aAo+ID4gPiBleGNlcHQgdGhhdCB5
b3Ugd2FudCB0byBza2lwIHRoZSBQQ0lfUE1fQ1RSTCB3cml0ZT8KPiA+ID4KPiA+Cj4gPiBleGFj
dGx5LiBJIGFtIHJ1bm5pbmcgd2l0aCB0aGlzIHdvcmthcm91bmQgZm9yIGEgd2hpbGUgbm93IGFu
ZCBuZXZlcgo+ID4gaGFkIGFueSBmYWlscyB3aXRoIGl0IGFueW1vcmUuIFRoZSBHUFUgZ2V0cyB0
dXJuZWQgb2ZmIGNvcnJlY3RseSBhbmQgSQo+ID4gc2VlIHRoZSBzYW1lIHBvd2VyIHNhdmluZ3Ms
IGp1c3QgdGhhdCB0aGUgR1BVIGNhbiBiZSBwb3dlcmVkIG9uIGFnYWluLgo+ID4KPiA+ID4gVGhh
dCBzZWVtcyBsaWtlIHNvbWV0aGluZyBSYWZhZWwgc2hvdWxkIHdlaWdoIGluIG9uLiAgSSBkb24n
dCBrbm93Cj4gPiA+IHdoeSB3ZSBzZXQgdGhlIGRldmljZSB0byBEM2hvdCB3aXRoIFBDSV9QTV9D
VFJMIGJlZm9yZSB1c2luZyB0aGUgQUNQSQo+ID4gPiBtZXRob2RzLCBhbmQgSSBkb24ndCBrbm93
IHdoYXQgdGhlIGVmZmVjdCBvZiBza2lwcGluZyB0aGF0IGlzLiAgSXQKPiA+ID4gc2VlbXMgYSBs
aXR0bGUgbWVzc3kgdG8gc2xpY2Ugb3V0IHRoaXMgdGlueSBwaWVjZSBmcm9tIHRoZSBtaWRkbGUs
IGJ1dAo+ID4gPiBtYXliZSBpdCBtYWtlcyBzZW5zZS4KPiA+ID4KPiA+Cj4gPiBhZmFpayB3aGVu
IEkgd2FzIHRhbGtpbmcgd2l0aCBvdGhlcnMgaW4gdGhlIHBhc3QgYWJvdXQgaXQsIFdpbmRvd3Mg
aXMKPiA+IGRvaW5nIHRoYXQgYmVmb3JlIHVzaW5nIEFDUEkgY2FsbHMsIGJ1dCBtYXliZSB0aGV5
IGhhdmUgc29tZSBzaW1pbGFyCj4gPiB3b3JrYXJvdW5kcyBmb3IgY2VydGFpbiBpbnRlbCBicmlk
Z2VzIGFzIHdlbGw/IEkgYW0gc3VyZSBpdCBhZmZlY3RzCj4gPiBtb3JlIHRoYW4gdGhlIG9uZSBJ
IGFtIGJsYWNrbGlzdGluZyBoZXJlLCBidXQgSSByYXRoZXIgd2FudCB0byBjaGVjawo+ID4gZWFj
aCBkZXZpY2UgYmVmb3JlIGJsYWNrbGlzdGluZyBhbGwga2FieWxha2UgYW5kIHNreSBsYWtlIGJy
aWRnZXMgKGFzCj4gPiB0aG9zZSBhcmUgdGhlIG9uZXMgd2VyZSB0aGlzIGlzc3VlIGNhbiBiZSBv
YnNlcnZlZCkuCj4gPgo+ID4gU2FkbHkgd2UgaGFkIG5vIGx1Y2sgZ2V0dGluZyBhbnkgaW5mb3Jt
YXRpb24gYWJvdXQgc3VjaCB3b3JrYXJvdW5kIG91dAo+ID4gb2YgTnZpZGlhIG9yIEludGVsLgo+
Cj4gSSByZWFsbHkgd291bGQgbGlrZSB0byBwcm92aWRlIHlvdSBtb3JlIGluZm9ybWF0aW9uIGFi
b3V0IHN1Y2gKPiB3b3JrYXJvdW5kIGJ1dCBJJ20gbm90IGF3YXJlIG9mIGFueSA7LSkgSSBoYXZl
IG5vdCBzZWVuIGFueSBpc3N1ZXMgbGlrZQo+IHRoaXMgd2hlbiBEM2NvbGQgaXMgcHJvcGVybHkg
aW1wbGVtZW50ZWQgaW4gdGhlIHBsYXRmb3JtLiAgVGhhdCdzIHdoeQo+IEknbSBiaXQgc2tlcHRp
Y2FsIHRoYXQgdGhpcyBoYXMgYW55dGhpbmcgdG8gZG8gd2l0aCBzcGVjaWZpYyBJbnRlbCBQQ0ll
Cj4gcG9ydHMuIE1vcmUgbGlrZWx5IGl0IGlzIHNvbWUgcG93ZXIgc2VxdWVuY2UgaW4gdGhlIF9P
Ti9fT0ZGKCkgbWV0aG9kcwo+IHRoYXQgaXMgcnVuIGRpZmZlcmVudGx5IG9uIFdpbmRvd3MuCgp5
ZWFoLi4gbWF5YmUuIEkgcmVhbGx5IGRvbid0IGtub3cgd2hhdCdzIHRoZSBhY3R1YWwgcm9vdCBj
YXVzZS4gSSBqdXN0Cmtub3cgdGhhdCB3aXRoIHRoaXMgd29ya2Fyb3VuZCBpdCB3b3JrcyBwZXJm
ZWN0bHkgZmluZSBvbiBteSBhbmQgc29tZQpvdGhlciBzeXN0ZW1zIGl0IHdhcyB0ZXN0ZWQgb24u
IERvIHlvdSBrbm93IHdobyB3b3VsZCBiZSBiZXN0IHRvCmFwcHJvYWNoIHRvIGdldCBwcm9wZXIg
ZG9jdW1lbnRhdGlvbiBhYm91dCB0aG9zZSBtZXRob2RzIGFuZCB3aGF0IGFyZQp0aGUgYWN0dWFs
IHByZXJlcXVpc2l0ZXMgb2YgdGhvc2UgbWV0aG9kcz8KCldlIGtpbmQgb2YgdHJpZWQgd2l0aCBO
dmlkaWEsIGJ1dCBtYXliZSBoYXZpbmcgYSBtb3JlIHNwZWNpZmljCnF1ZXN0aW9uIHdvdWxkIGhl
bHAgaGVyZS4uLiBJIHdpbGwgdHJ5IHRvIGJyaW5nIHRoYXQgaXNzdWUgdXAgdGhlIG5leHQKdGlt
ZSB3aXRoIHRoZW0uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
