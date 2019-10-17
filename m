Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA23DB57E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 20:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACFB6E47E;
	Thu, 17 Oct 2019 18:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51B6E47E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 18:05:43 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id f13so2937106ils.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9e6esXdSKEchwo9t/UhDN2I/NCXL7m7+/GS8N3ZNVaw=;
 b=P61SpeY5DGy/WWCNN1rnKDfjqhYw0vQ4O/IchlSJe1F+l4NAhwGK4vk3go1KEsikvv
 W/ForQ4Xf22g6AGOJmtieByu6zcIL5m8ZcqxjhpovpTSldTrDe9WkLVELIdvL75aVUUR
 PUsN5kX9XGNtRZWz2clKAo/4/Fna2uClYJb+gz/cODIPkn8k792JNeK0KL4S+aNKJ4po
 xMnG8uq4hh4IZVfh/BX1VlcdklvTkg7YDgGjUE7nKHQIrqdnCpcdYV9diTq5WRMH2/Sf
 892gbk4+Zn2ntXctsO26fGUsa7bMqV53Y1D6KAGy8Z8p/DZA32ikS44ZspSMOMWNf8Lk
 h9qw==
X-Gm-Message-State: APjAAAXYe5qRlpw+EinpkLi0nFzQOZIlzeGpKYw+vVvTZBGfVYYpIYyq
 xopgY3tQEtOeAqW4Aa7HrknqcOqiN8QUwaZfleE=
X-Google-Smtp-Source: APXvYqwhwDIMPJoLzHwPVEvU2F9RoxMzXULGAdvGmW2ojPx7JzrM7mkHKQqk4RD2cXkAHW+OVeWRX0R7l1G1AxI4u5U=
X-Received: by 2002:a92:6a04:: with SMTP id f4mr5306698ilc.205.1571335543030; 
 Thu, 17 Oct 2019 11:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122542.8449-1-tomi.valkeinen@ti.com>
 <CAHCN7xLjGkLHMWejEk-3vJ-OwzjB+BXtnPWoonh4mAVxbkzMWQ@mail.gmail.com>
In-Reply-To: <CAHCN7xLjGkLHMWejEk-3vJ-OwzjB+BXtnPWoonh4mAVxbkzMWQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 17 Oct 2019 13:05:31 -0500
Message-ID: <CAHCN7xKN7CePgajQLH61dBaoLWZ4VMxo39_xJOWHyvM3x_0i=A@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: fix max fclk divider for omap36xx
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9e6esXdSKEchwo9t/UhDN2I/NCXL7m7+/GS8N3ZNVaw=;
 b=pywovx149iqExuPpCztzKPaZyHlSqopn1Yu6ZuQhPKw6kzhNWw/tEKI1Iq6tkYxn+E
 Ny6vInaz8h3aq0ByQ/eTn0kIYSFU5ZEXl4hA4Ybg0DjBQWH1bI2/hChDrUBJWjpzUN0P
 sCa9Df10e9ysv5XE80CEQzMRwRhJMmPnyWT4L41CNnw+jTvnjeC2aj6HzHcKr1sZnrFe
 E4aubbc8D+4XxvgYEhHczLMlytY1NqNcCCDsL80CjMQr/jYvlbB2b+OXQtbN7Bnxzr6T
 eeqyBo8JtAPnFZbWCtgrVCMkWKdoZ+vntrZJS6RF9jHrkSWtEp01+WdVBybwnhctoN0y
 Fr4A==
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, stable <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgMTMsIDIwMTkgYXQgMTA6NTYgQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMiwgMjAxOSBhdCA3OjI1IEFNIFRvbWkgVmFs
a2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBPTUFQMzZ4
eCBhbmQgQU0vRE0zN3ggVFJNcyBzYXkgdGhhdCB0aGUgbWF4aW11bSBkaXZpZGVyIGZvciBEU1Mg
ZmNsawo+ID4gKGluIENNX0NMS1NFTF9EU1MpIGlzIDMyLiBFeHBlcmltZW50YXRpb24gc2hvd3Mg
dGhhdCB0aGlzIGlzIG5vdAo+ID4gY29ycmVjdCwgYW5kIHVzaW5nIGRpdmlkZXIgb2YgMzIgYnJl
YWtzIERTUyB3aXRoIGEgZmxvb2Qgb3IgdW5kZXJmbG93cwo+ID4gYW5kIHN5bmMgbG9zdHMuIERp
dmlkZXJzIHVwIHRvIDMxIHNlZW0gdG8gd29yayBmaW5lLgo+ID4KPiA+IFRoZXJlIGlzIGFub3Ro
ZXIgcGF0Y2ggdG8gdGhlIERUIGZpbGVzIHRvIGxpbWl0IHRoZSBkaXZpZGVyIGNvcnJlY3RseSwK
PiA+IGJ1dCBhcyB0aGUgRFNTIGRyaXZlciBhbHNvIG5lZWRzIHRvIGtub3cgdGhlIG1heGltdW0g
ZGl2aWRlciB0byBiZSBhYmxlCj4gPiB0byBpdGVyYXRpdmVseSBmaW5kIGdvb2QgcmF0ZXMsIHdl
IGFsc28gbmVlZCB0byBkbyB0aGUgZml4IGluIHRoZSBEU1MKPiA+IGRyaXZlci4KPiA+Cj4KPiBU
b21pLAo+Cj4gSXMgdGhlcmUgYW55IHdheSB5b3UgY2FuIGRvIGEgcGF0Y2ggZm9yIHRoZSBGQiB2
ZXJzaW9uIGZvciB0aGUgb2xkZXIKPiA0LjkgYW5kIDQuMTQga2VybmVscz8gIEkgdGhpbmsgdGhl
eSBhcmUgc3RpbGwgZGVmYXVsdGluZyB0byB0aGUgb21hcGZiCj4gaW5zdGVhZCBvZiBEUk0sIHNv
IHRoZSB1bmRlcmZsb3cgaXNzdWUgc3RpbGwgYXBwZWFycyBieSBkZWZhdWx0IGFuZAo+IHRoZSBw
YXRjaCBvbmx5IGltcGFjdHMgdGhlIERSTSB2ZXJzaW9uIG9mIHRoZSBkcml2ZXIuICBJZiBub3Qs
IGRvIHlvdQo+IGhhdmUgYW55IG9iamVjdGlvbnMgaWYgSSBzdWJtaXQgYSBwYXRjaCB0byBzdGFi
bGUgZm9yIHRob3NlIHR3byBMVFMKPiBicmFuY2hlcz8KCkdlbnRsZSBudWRnZSBvbiB0aGlzIHF1
ZXN0aW9uLiAgSSBjYW4gZG8gdGhlIHdvcmssIGJ1dCBJIGp1c3QKcGVybWlzc2lvbiBzbyBkb24n
dCBvdmVyc3RlcC4KCmFkYW0KPgo+IHRoYW5rcywKPgo+IGFkYW0KPiA+IFNpZ25lZC1vZmYtYnk6
IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gPiBDYzogQWRhbSBGb3Jk
IDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4g
LS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jIHwgMiArLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvZHNzLmMKPiA+IGluZGV4IGUyMjYzMjRhZGI2OS4uNGJkZDYzYjU3MTAw
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKPiA+IEBAIC0xMDgzLDcgKzEw
ODMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRzc19mZWF0dXJlcyBvbWFwMzR4eF9kc3NfZmVh
dHMgPSB7Cj4gPgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1cmVzIG9tYXAzNjMw
X2Rzc19mZWF0cyA9IHsKPiA+ICAgICAgICAgLm1vZGVsICAgICAgICAgICAgICAgICAgPSAgICAg
ICBEU1NfTU9ERUxfT01BUDMsCj4gPiAtICAgICAgIC5mY2tfZGl2X21heCAgICAgICAgICAgID0g
ICAgICAgMzIsCj4gPiArICAgICAgIC5mY2tfZGl2X21heCAgICAgICAgICAgID0gICAgICAgMzEs
Cj4gPiAgICAgICAgIC5mY2tfZnJlcV9tYXggICAgICAgICAgID0gICAgICAgMTczMDAwMDAwLAo+
ID4gICAgICAgICAuZHNzX2Zja19tdWx0aXBsaWVyICAgICA9ICAgICAgIDEsCj4gPiAgICAgICAg
IC5wYXJlbnRfY2xrX25hbWUgICAgICAgID0gICAgICAgImRwbGw0X2NrIiwKPiA+IC0tCj4gPiBU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KPiA+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
