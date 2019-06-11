Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E93D458
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256FC8914F;
	Tue, 11 Jun 2019 17:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DA88914F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:36:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p26so17265566edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Vv1n8BWYbOr1+qJPQYOqAuRSUtYysqcBdPrCu7t3Fo=;
 b=uYqgHvlof28zgXcmQ6JWeykYN5RUoAVo6cjBCMm9oQJ9BgPXId2kve9An2ND8a/IB9
 YFioxQcNRhWrZjk2VSbd4VT0x+W/NZf7qezZpwIlvsZDhXj3Pq/YRymi6RFe//eI5u4d
 TB4aBr82YoS+HgIbq36waXCyqUooD6RTWfbdYSzsmHl/1rapIZrZxzBFuAEAn+2mQgma
 U9MAUnXySeOMax2RCocHo8UCTrz0goE2hKApY2uLCfA9p17N1gXLIYyGS9BsdF6EF351
 MOxvrTlEvULO3yidOhU2N+wNv+E5NhZO86QqauYILxm8Xu/efvmlFffn0CszjXZsxJZV
 RkgA==
X-Gm-Message-State: APjAAAUYig37uvYb56t/sNJNPILOXZLkjRpXE3HHqz4DqKgbawiBbhQF
 IPDXpJMU3lw4apeCHkU/J/ljpqH28UY=
X-Google-Smtp-Source: APXvYqxS/Tvtt1k1l4Oc0yqjFxiHDSHNckAeP1FWxFmk7doraVTdP4PlnLrcAQp769cYcf1JtMZJKw==
X-Received: by 2002:a50:92fc:: with SMTP id l57mr57761144eda.206.1560274615181; 
 Tue, 11 Jun 2019 10:36:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z28sm1844333edm.5.2019.06.11.10.36.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 10:36:54 -0700 (PDT)
Date: Tue, 11 Jun 2019 19:36:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [GIT PULL] omapdrm changes for 5.3
Message-ID: <20190611173651.GK2458@phenom.ffwll.local>
References: <a709f57d-6909-8550-3932-d84e0b5bc3ef@ti.com>
 <20190611113051.GB2458@phenom.ffwll.local>
 <20190611161921.5uoib4vr5gckkdpx@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611161921.5uoib4vr5gckkdpx@earth.universe>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7Vv1n8BWYbOr1+qJPQYOqAuRSUtYysqcBdPrCu7t3Fo=;
 b=IaT8dCRSLSTSiWIXQ50bDspvqGjGtSdkVb9+P3+qF4s77StZFYybg9REgBYAgDuwPi
 hgTaDAnL1rxZy36xf+BOz9qEkSrCDEkakGxG20vNUT0ECgPjsICpHei63B4d5FxOBECv
 fTlaObPfmj166IHgm06YGccY8+vhRfiTluN8s=
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDY6MTk6MjFQTSArMDIwMCwgU2ViYXN0aWFuIFJlaWNo
ZWwgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDAxOjMw
OjUxUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxMSwgMjAx
OSBhdCAxMTowNTo0MEFNICswMzAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiA+ID4gSGkgRGF2
ZSwKPiA+ID4gCj4gPiA+IFBsZWFzZSBwdWxsIG9tYXBkcm0gY2hhbmdlcyBmb3IgNS4zLgo+ID4g
PiAKPiA+ID4gIFRvbWkKPiA+ID4gCj4gPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgMzk2ZjlhY2FmZmQ4N2U0NGI4YjAyYmM2MGYwNmRjOTQ5YjgzMmI3ZToKPiA+ID4gCj4g
PiA+ICAgTWVyZ2UgYnJhbmNoICdkcm0tbmV4dC01LjMnIG9mIGdpdDovL3Blb3BsZS5mcmVlZGVz
a3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8gZHJtLW5leHQgKDIwMTktMDYtMDYgMTQ6Mjg6MjYg
KzEwMDApCj4gPiA+IAo+ID4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKPiA+ID4gCj4gPiA+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvbWJhL2xpbnV4LmdpdCB0YWdzL29tYXBkcm0tNS4zCj4gPiA+IAo+ID4gPiBmb3Ig
eW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMWJiNDE4YmZmZGQ2Zjk1YTQxZThlNTliZTYzOTMz
YmM4NGZkZTEzYzoKPiA+ID4gCj4gPiA+ICAgZHJtL29tYXA6IGFkZCBzdXBwb3J0IGZvciBtYW51
YWxseSB1cGRhdGVkIGRpc3BsYXlzICgyMDE5LTA2LTEwIDE3OjA0OjE1ICswMzAwKQo+ID4gPiAK
PiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ID4gPiBvbWFwZHJtIGNoYW5nZXMgZm9yIDUuMwo+ID4gPiAKPiA+ID4g
LSBBZGQgc3VwcG9ydCBmb3IgRFNJIGNvbW1hbmQgbW9kZSBkaXNwbGF5cwo+ID4gCj4gPiBUaGFu
a3MsIHB1bGxlZC4KPiAKPiBGaW5hbGx5IDopCgpIbSB3aHk/IFB1bGwgaXMgbGVzcyB0aGFuIGEg
ZGF5IG9sZCwgYW5kIEkgZGlkbid0IHNlZSBhbiBvbGRlciBvbmUgdGhhdApEYXZlIG9yIG1lIG1p
c3NlZCAuLi4KCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gRW1pbCBWZWxpa292ICgxKToKPiA+ID4gICAg
ICAgZHJtL29tYXA6IHJlbW92ZSBvcGVuLWNvZGVkIGRybV9pbnZhbGlkX29wKCkKPiA+ID4gCj4g
PiA+IEtlZmVuZyBXYW5nICgxKToKPiA+ID4gICAgICAgZHJtL29tYXA6IFVzZSBkZXZfZ2V0X2Ry
dmRhdGEoKQo+ID4gPiAKPiA+ID4gU2ViYXN0aWFuIFJlaWNoZWwgKDQpOgo+ID4gPiAgICAgICBk
cm0vb21hcDogdXNlIERSTV9ERUJVR19EUklWRVIgaW5zdGVhZCBvZiBDT1JFCj4gPiA+ICAgICAg
IGRybS9vbWFwOiBkb24ndCBjaGVjayBkaXNwYyB0aW1pbmdzIGZvciBEU0kKPiA+ID4gICAgICAg
ZHJtL29tYXA6IGFkZCBmcmFtZWRvbmUgaW50ZXJydXB0IHN1cHBvcnQKPiA+ID4gICAgICAgZHJt
L29tYXA6IGFkZCBzdXBwb3J0IGZvciBtYW51YWxseSB1cGRhdGVkIGRpc3BsYXlzCj4gPiAKPiA+
IFRoaXMgc2VlbXMgdG8gcmVpbnZlbnQgZHJtX2F0b21pY19oZWxwZXJfZGlydHkoKSwgSSd2ZSBj
YydlZCB5b3Ugb24gYSBkb2MKPiA+IHBhdGNoLiBBbHNvIHRoZSBmYmRldiBkaXJ0eSBzdHVmZiBz
ZWVtcyB0byBiZSBtaXNzaW5nIGhlcmUsIHlvdSBtaWdodCB3YW50Cj4gPiB0byBsb29rIGF0IE5v
cmFsZidzIGdlbmVyaWMgZmJkZXYgc3R1ZmYgdG8gdGFrZSBjYXJlIG9mIGFsbCBvZiB0aGlzIGZv
cgo+ID4geW91Lgo+IAo+IFRoYW5rcywgSSBhbHJlYWR5IG5vdGljZWQgdGhlIHBhdGNoIHNlcmll
cyBhZGRpbmcgdGhpcywgYnV0IGRpZCBub3QKPiB5ZXQgZmluZCBlbm91Z2ggdGltZSB0byBjaGVj
ayB0aGUgZGV0YWlscy4gVGhlIG9tYXBkcm0gcGF0Y2hlcwo+IHByZWRhdGUgdGhpcyB3b3JrLiBU
aGUgcGxhbiB3YXMgdG8gZ2V0IHRoZSBhYm92ZSB3b3JrIG1lcmdlZCBmaXJzdCwKPiBzbyB0aGF0
IGl0J3MgZWFzaWVyIHRvIGNhdGNoIHJlZ3Jlc3Npb25zIGFuZCB1bmJsb2NrIGNvbW11bml0eSB3
b3JrCj4gb24gRHJvaWQgNC4KPiAKPiBNeSBwbGFuIHdhcyB0byBmaXJzdCBjb252ZXJ0IHRoZSBE
U0kgcGFydCBmcm9tIG9tYXBkcm0gdG8gdXNlCj4gbWlwaV9kc2lfZGV2aWNlIGFuZCBkcm1fcGFu
ZWwgQVBJIGFuZCB0aGVuIGxvb2sgYXQgZHJtX2F0b21pY19oZWxwZXJfZGlydHlmYgo+IGFmdGVy
d2FyZHMuCgpVc2luZyBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eSBzaG91bGQgZXNzZW50aWFsbHkg
YmUgYSAicmVtb3ZlIGEgcGlsZSBvZgpsaW5lcywgcmVwbGFjZSB3aXRoIG9uZSIga2luZCBvZiBw
YXRjaC4gRm9yIGFuIGV4YW1wbGUsIHNlZSB0aGUgb25lIEdlcmQKanVzdCBwb3N0ZWQgZm9yIHZp
cnRpby4gSXQncyBwcmV0dHkgbG93LWhhbmdpbmcgZnJ1aXQgOi0pCgpJIHRoaW5rIHRoZSBiaWdn
ZXIgZmlzaCB0byBmcnkgaXMgc3dpdGNoaW5nIG92ZXIgdG8gdGhlIGdlbmVyaWMgZmJkZXYKZW11
bGF0aW9uLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
