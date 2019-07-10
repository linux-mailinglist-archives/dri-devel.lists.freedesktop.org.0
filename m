Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EC64981
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E916E0F6;
	Wed, 10 Jul 2019 15:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34C86E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:26:26 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e3so2563984edr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=HvP9tTAwaaYJMZBGKOx/DXOnWdBe7zTCNsTQBUNN9UU=;
 b=Cy4k/s38/iaEGdOyovb7rQKeAu6k09GZBRnR7Q5fGJYNscgCi7VMf2pS7zkQg2Bzcu
 LS/OiebKsahlFplBFpeZ0iBeFKafQaQj3sp3mqfjTCb52edgsnRWXSWgtk3diQcXklrO
 VnCFXYUpngBHbybeN9VkBnwXsI/nZzezOwv1EHrTGdB8Z9OopEhGNzONSgd0iQd5xZ5p
 NWmeO+enq5ULU6nmjcnBQW+lY2yfxyiNSSQ+sVwxLF+v2iv/kDugRyRPleJ1QpiQbpwf
 ojJT1UBrEBTV+PbOrhhhw3Sahvg9o0QcGr67Y8kJjySRSXNP1Om2gmuXu03VVtNDGVR7
 F+BA==
X-Gm-Message-State: APjAAAVYX71WGDbWNHr0NyydFc+m3A9UbsH2upeYYHN9Ba5qWEGViL4D
 agFqVo1h6j1h5XkboOKHe6X7kQ==
X-Google-Smtp-Source: APXvYqwZSKTcqghlbKyxkHf0tDpdI8vigua52BxvTNHkEi7ce7m7sGHenyW6atReTQ2tdo2izE3LaQ==
X-Received: by 2002:a50:ad01:: with SMTP id y1mr31465279edc.180.1562772385633; 
 Wed, 10 Jul 2019 08:26:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id o22sm817784edc.37.2019.07.10.08.26.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:26:24 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:26:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 1/2] drm/vram: store dumb bo dimensions.
Message-ID: <20190710152622.GQ15868@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
References: <20190626065551.12956-1-kraxel@redhat.com>
 <20190626065551.12956-2-kraxel@redhat.com>
 <20190626144013.GB12510@ravnborg.org>
 <20190626162754.GV12905@phenom.ffwll.local>
 <20190708163945.1d3757b3@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708163945.1d3757b3@eldfell.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=HvP9tTAwaaYJMZBGKOx/DXOnWdBe7zTCNsTQBUNN9UU=;
 b=VE9DvZ7tmj0h7eXR7nx6Y/YBeM0ouoY0jSH+AKwdDxRg1jMJ3ZAe6qYjsPHKrfNvCp
 IB4k743Buiu9MvGx1Fap8pBYM3ufk2ygUOnCSObcdgLRSwMnWLLbTKLXz1FpegaaCLcU
 cpc5lSpvwthHG5nAS4DFOKnVLt4PXeuVxW1sE=
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
Cc: tzimmermann@suse.de, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDQ6Mzk6NDVQTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gV2VkLCAyNiBKdW4gMjAxOSAxODoyNzo1NCArMDIwMAo+IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBh
dCAwNDo0MDoxM1BNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiA+IEhpIEdlcmQuCj4g
PiA+IAo+ID4gPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwODo1NTo1MEFNICswMjAwLCBHZXJk
IEhvZmZtYW5uIHdyb3RlOiAgCj4gPiA+ID4gU3RvcmUgd2lkdGggYW5kIGhlaWdodCBvZiB0aGUg
Ym8uICBOZWVkZWQgaW4gY2FzZSB1c2Vyc3BhY2UKPiA+ID4gPiBzZXRzIHVwIGEgZnJhbWVidWZm
ZXIgd2l0aCBmYi0+d2lkdGggIT0gYm8tPndpZHRoLi4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+ID4gPiAtLS0KPiA+
ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICB8IDEgKwo+ID4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMiArKwo+ID4gPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmgKPiA+ID4gPiBpbmRleCAxYTBlYTE4ZTdhNzQuLjM2OTJkYmExNjdk
ZiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgK
PiA+ID4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKPiA+ID4gPiBA
QCAtMzksNiArMzksNyBAQCBzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCB7Cj4gPiA+ID4gIAlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgZ2VtOwo+ID4gPiA+ICAJc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0IGJvOwo+ID4gPiA+ICAJc3RydWN0IHR0bV9ib19rbWFwX29iaiBrbWFwOwo+ID4gPiA+ICsJ
dW5zaWduZWQgaW50IHdpZHRoLCBoZWlnaHQ7Cj4gPiA+ID4gIAo+ID4gPiA+ICAJLyogU3VwcG9y
dGVkIHBsYWNlbWVudHMgYXJlICVUVE1fUExfVlJBTSBhbmQgJVRUTV9QTF9TWVNURU0gKi8KPiA+
ID4gPiAgCXN0cnVjdCB0dG1fcGxhY2VtZW50IHBsYWNlbWVudDsKPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiA+ID4gPiBpbmRleCA0ZGU3ODJjYTI2YjIuLmMwMmJm
NzY5NDExNyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYwo+ID4gPiA+IEBAIC0zNzcsNiArMzc3LDggQEAgaW50IGRybV9nZW1fdnJhbV9maWxsX2Ny
ZWF0ZV9kdW1iKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiA+ID4gPiAgCWdibyA9IGRybV9nZW1f
dnJhbV9jcmVhdGUoZGV2LCBiZGV2LCBzaXplLCBwZ19hbGlnbiwgaW50ZXJydXB0aWJsZSk7Cj4g
PiA+ID4gIAlpZiAoSVNfRVJSKGdibykpCj4gPiA+ID4gIAkJcmV0dXJuIFBUUl9FUlIoZ2JvKTsK
PiA+ID4gPiArCWdiby0+d2lkdGggPSBhcmdzLT53aWR0aDsKPiA+ID4gPiArCWdiby0+aGVpZ2h0
ID0gYXJncy0+aGVpZ2h0Owo+ID4gPiA+ICAKPiA+ID4gPiAgCXJldCA9IGRybV9nZW1faGFuZGxl
X2NyZWF0ZShmaWxlLCAmZ2JvLT5nZW0sICZoYW5kbGUpOwo+ID4gPiA+ICAJaWYgKHJldCkgIAo+
ID4gPiAKPiA+ID4gQmUgd2FybmVkLCBJIG1heSBoYXZlIG1pc3NlZCBzb21ldGhpbmcgaW4gdGhl
IGJpZ2dlciBwaWN0dXJlLgo+ID4gPiAKPiA+ID4gWW91ciBwYXRjaCB3aWxsIHNldCB3aWR0aCBh
bmQgaGVpZ2h0IG9ubHkgZm9yIGR1bWIgYm8ncwo+ID4gPiBCdXQgd2UgaGF2ZSBzZXZlcmFsIHVz
ZXJzIG9mIGRybV9nZW1fdnJhbV9jcmVhdGUoKSB0aGF0IHdpbGwKPiA+ID4gbm90IHNldCB0aGUg
d2lkdGggYW5kIGhlaWdodC4KPiA+ID4gCj4gPiA+IFNvIG9ubHkgaW4gc29tZSBjYXNlcyBjYW4g
d2UgcmVseSBvbiB0aGVtIGJlaW5nIHNldC4KPiA+ID4gU2hvdWxkIHRoaXMgYmUgcmVmYWN0b3Jl
ZCBzbyB3ZSBhbHdheXMgc2V0IHdpZHRoLCBoZWlnaHQuCj4gPiA+IE9yIG1heWJlIHNheSBpbiBh
IHNtYWxsIGNvbW1lbnQgdGhhdCB3aWR0aCxoZWlnaHQgYXJlIG9ubHkKPiA+ID4gc2V0IGZvciBk
dW1iIGJvJ3M/ICAKPiA+IAo+ID4gQWxzbyBmb3IgZHVtYiBibyBhbGxvY2F0ZWQgYnVmZmVycyBp
ZiB1c2Vyc3BhY2UgZ2V0cyB0aGUgZGltZW5zaW9ucyB3cm9uZwo+ID4gYmV0d2VlbiBkdW1iX2Ny
ZWF0ZSBhbmQgdGhlIGFkZGZiLCBzb21ldGhpbmcgaXMgd3JvbmcuIFBhcGVyaW5nIG92ZXIgdGhh
dAo+ID4gYnkgcmVtZW1iZXJpbmcgdGhlIHJpZ2h0IGRpbWVuc2lvbnMgZG9lc24ndCBsb29rIGxp
a2UgYSBnb29kIHNvbHV0aW9uLgo+IAo+IEhpLAo+IAo+IGp1c3QgYSBub3RlIGlycmVsZXZhbnQg
dG8gdGhpcyBwYXJ0aWN1bGFyIGRyaXZlcjoKPiAKPiBJIGhhdmUgZGVsaWJlcmF0ZWx5IGFsbG9j
YXRlZCBhIHRvbyBoaWdoIGR1bWIgYnVmZmVyIGluIHVzZXJzcGFjZSBhbmQKPiBjcmVhdGVkIG11
bHRpcGxlIHNtYWxsZXIgRFJNIEZCcyBvdXQgb2YgaXQgd2l0aCBkaWZmZXJlbnQgb2Zmc2V0cwo+
IChpICogMTI4ICogc3RyaWRlKS4gVGhpcyBoYXMgYmVlbiBhIHZlcnkgdXNlZnVsIGhhY2sgdG8g
c2VlIHRoYXQgYQo+IEdQVS1sZXNzIGRyaXZlciBhY3R1YWxseSBob25vdXJzIGZlbmNlcyBjb3Jy
ZWN0bHksIGJlY2F1c2UgaWYgaXQKPiBkb2Vzbid0LCB0aGUgd2hvbGUgaW1hZ2Ugd2lsbCBiZSBv
ZmYgYnkgdGhlIG9mZnNldCBkZWx0YSwgd2hpY2ggaXMKPiBlcGlsZXB0aWNhbGx5IGVhc3kgdG8g
c2VlLgo+IAo+IFNvIEknbSBub3QgZ2V0dGluZyB0aGUgaGVpZ2h0IHdyb25nLCBJIGFtIGRlbGli
ZXJhdGVseSBvdmVyYWxsb2NhdGluZwo+IGFuZCBhbGlhc2luZy4KClllYWggdGhhdCdzIHRoZSBv
dGhlciByZWFzb24gZm9yIHdoeSB0aGlzIHBhdGNoIGlzIHdyb25nOiBJdCB3b3VsZCBicmVhawp0
aGluZ3MgbGlrZSB0aGlzIHRyaWNrZXJ5IGhlcmUgOi0pIFRoZSBzZXBhcmF0aW9uIGJldHdlZW4g
YmFja2luZyBzdG9yYWdlCmFuZCBkcm1fZmIgaXMgaW50ZW50aW9uYWwsIG11bHRpcGxlIGZiIGlu
IG9uZSBvdmVyYWxsIGZiIGlzIGV4cGxpY2l0bHkgb2suCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
