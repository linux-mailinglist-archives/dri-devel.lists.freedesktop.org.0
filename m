Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16815A1AB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 19:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCFB6E961;
	Fri, 28 Jun 2019 17:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5536E961
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 17:02:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so11654776edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+rEOcuZqJ2QYzyNijdpTMXBq0CSBqKNvn4g0ifWMdQM=;
 b=Vs8j8a15VjhK5l9Vp6Aog10VsLtXWtjddFk5Rgdi/t0SL+L6smW4EX2aGW3EY6t9BR
 eCdLvzzBQegW5tL/kp8R2YXSpHqWv8WZpbOMqcn88tG5PpuEx00j+OFMwle4n9REwfvx
 89R+uPoknt6O09B8ADOQB+w8oVz09cahMc9ccw0hjP/xCh6LdhHvHfOCe+LYgUUHboEY
 Rfj39574kE6AMsYaXyI3MChpVrFBypCZCYcGweike1O5bV1w9qO0jiS1leF5IRGWXmzd
 V+yBPf9pO1ZkqrhNbGp5iIoy5/+3aTISBU8rmeZmP0+Wbxd2hV8/droAf252p8itbygp
 W+TQ==
X-Gm-Message-State: APjAAAXAW5wFP+ApjOuQfZrDVnTfAJy1RudNqC/SHkglgzMARwk2fN6c
 rfqeiYthc8RIhu/CcM5QsJNbIQ==
X-Google-Smtp-Source: APXvYqxa9L0Xb6uYD77D5DWKT5isHFExqTVwLjzZLDDWaNUaUHAll0GMfuC17K9g4kkMPpiQA02fWw==
X-Received: by 2002:a50:f982:: with SMTP id q2mr12653210edn.270.1561741337732; 
 Fri, 28 Jun 2019 10:02:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s26sm537734eja.81.2019.06.28.10.02.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:02:16 -0700 (PDT)
Date: Fri, 28 Jun 2019 19:02:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Deepak Singh Rawat <drawat@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx: Don't look at state->allow_modeset
Message-ID: <20190628170214.GV12905@phenom.ffwll.local>
References: <20190520223500.6032-1-daniel.vetter@ffwll.ch>
 <e93299564404090bd8275ae4566893965e57f13f.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e93299564404090bd8275ae4566893965e57f13f.camel@vmware.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+rEOcuZqJ2QYzyNijdpTMXBq0CSBqKNvn4g0ifWMdQM=;
 b=ZBAhQKnS27hkYq2eQ614gqxdAeDTcqAfJaKXkLDL1Avbtdwtu8JXVrsiZC+DF329pq
 YOoSK+oX9k3hz9iKrrPHgO1YwfVz48l/iEWAVasQzXuFTC1oCfi03BDl7ihYQ8gJ8iBj
 BhR/tK3k1+ns+6Ovdb/azT6M2xZ+yt+CgXIN0=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDI6NTg6MzZQTSArMDAwMCwgRGVlcGFrIFNpbmdoIFJh
d2F0IHdyb3RlOgo+IFJldmlld2VkLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29t
PgoKVGhhbmtzIGZvciB5b3VyIHJldmlldywgSSd2ZSBtZXJnZWQgdGhpcyBpbnRvIGRybS1taXNj
LW5leHQgc28gaXQgd29uJ3QKZ2V0IGxvc3QgYWdhaW4uIFNob3VsZCBsYW5kIGZvciA1LjQuCi1E
YW5pZWwKCj4gCj4gT24gVHVlLCAyMDE5LTA1LTIxIGF0IDAwOjM1ICswMjAwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4gVGhhdCdzIHB1cmVseSBmb3IgdGhlIHVhcGkgbGF5ZXIgdG8gaW1wbGVt
ZW50IHRoZSBBTExPV19NT0RFU0VUIGZsYWcuCj4gPiAKPiA+IERyaXZlcnMgc2hvdWxkIGluc3Rl
YWQgbG9vayBhdCB0aGUgc3RhdGUsIGUuZy4gdGhyb3VnaAo+ID4gZHJtX2F0b21pY19jcnRjX25l
ZWRzX21vZGVzZXQoKSwgd2hpY2ggdm13Z2Z4IGFscmVhZHkgZG9lcy4gQWxzbwo+ID4gcmVtb3Zl
Cj4gPiB0aGUgY29uZnVzaW5nIGNvbW1lbnQsIHNpbmNlIGNoZWNraW5nIGFsbG93X21vZGVzZXQg
aXMgYXQgYmVzdCBhCj4gPiBtaWNybwo+ID4gb3B0aW1pemF0aW9uLgo+ID4gCj4gPiB2MjogUmVi
YXNlCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gPiBDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFp
bmVyQHZtd2FyZS5jb20+Cj4gPiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdh
cmUuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMg
fCA4IC0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwo+ID4gaW5kZXggYjk3YmM4ZTU5NDRi
Li4zNDI4NGYwZjUwODQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMK
PiA+IEBAIC0xNzA0LDE0ICsxNzA0LDYgQEAgdm13X2ttc19hdG9taWNfY2hlY2tfbW9kZXNldChz
dHJ1Y3QgZHJtX2RldmljZQo+ID4gKmRldiwKPiA+ICAJaWYgKHJldCkKPiA+ICAJCXJldHVybiBy
ZXQ7Cj4gPiAgCj4gPiAtCWlmICghc3RhdGUtPmFsbG93X21vZGVzZXQpCj4gPiAtCQlyZXR1cm4g
cmV0Owo+ID4gLQo+ID4gLQkvKgo+ID4gLQkgKiBMZWdhY3kgcGF0aCBkbyBub3Qgc2V0IGFsbG93
X21vZGVzZXQgcHJvcGVybHkgbGlrZQo+ID4gLQkgKiBAZHJtX2F0b21pY19oZWxwZXJfdXBkYXRl
X3BsYW5lLCBUaGlzIHdpbGwgcmVzdWx0IGluCj4gPiB1bm5lY2Vzc2FyeSBjYWxsCj4gPiAtCSAq
IHRvIHZtd19rbXNfY2hlY2tfdG9wb2xvZ3kuIFNvIGV4dHJhIHNldCBvZiBjaGVjay4KPiA+IC0J
ICovCj4gPiAgCWZvcl9lYWNoX25ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBjcnRjX3N0
YXRlLCBpKSB7Cj4gPiAgCQlpZiAoZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoY3J0Y19z
dGF0ZSkpCj4gPiAgCQkJbmVlZF9tb2Rlc2V0ID0gdHJ1ZTsKPiAKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
