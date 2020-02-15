Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01715FFF5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 20:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03E76E909;
	Sat, 15 Feb 2020 19:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740EB6E909
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 19:11:15 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id z9so12382673oth.5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 11:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DIjwda0bD9jiEv5pqKh3c8MTLKpMyxL2Dw5EU5R/+Yc=;
 b=e93UN9uuUsW40UlCW0zCtpXEy1TeSaIOdaLIMKF6M5LGlXvUTQrxwH7UAvsNclSYyT
 JNsZf6C0bRw3DKD9lCyC1FOFzd1T6MbttxCJLHArHywNb4nHxknokrXGguxg2yupYNt7
 enGAeDyzwQD4skEa3ZAj7Yvuce+vpijjT4EXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DIjwda0bD9jiEv5pqKh3c8MTLKpMyxL2Dw5EU5R/+Yc=;
 b=tQSfG9ZzhEszGRXAx+Oyk4ui1xlFAXIVCnAHGAp2Di7b3f3hJZrdOJSQOcpgZGM9H0
 ROq7vg0DT0Qpp8RJQ+XMfl/l61Ftcrx+ux57Dn0kk8rJVC7QdPTjwOe9xePdNS7xZlqA
 xM+0U5dRsBj+QaTF8aUTdERA044mzyK+bZVDDelO1dV/gSBBmGcvd3sY7l6tKH9fij3f
 2ChUBW094yJ54x2a9mQQliTlB1+SCcYXuETzSYO9+KCpJoUGKbU2TwNlp9av0wJuW9Jh
 4kCG5z1Gc8vfLjjyragrHxWqoZim+2VzRKLhJin45L9UIU1iFa8wVVo04mn0FH/zfISS
 hYOA==
X-Gm-Message-State: APjAAAXtgCKekpp/mYXfg29EVs/V0gBXzSZsaDNQXNDZA42YPD29TLiU
 jTNre8OtcT8KsG5uKidsALzSLvXmIRHSGmgBUG7Fbw==
X-Google-Smtp-Source: APXvYqz5+gRFR7qAO5xcpC3y526r3jbx1F7sVdd0dKNSCFln6AWi/X8OH6iYKejfRUcEI/y8xRvGFy59rr1Pg2VSFMk=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr7190666otq.281.1581793874798; 
 Sat, 15 Feb 2020 11:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20200215183503.GA17310@ravnborg.org>
In-Reply-To: <20200215183503.GA17310@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 15 Feb 2020 20:11:03 +0100
Message-ID: <CAKMK7uFp5AzCxSeRg=ZibVnD0e8EhrsxYnuLeicUgp3gCr3Lpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm: drop unused drm_display_mode.private
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBGZWIgMTUsIDIwMjAgYXQgNzozNSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gZHJtX2Rpc3BsYXlfbW9kZS5wcml2YXRlIHdhcyBvbmx5IHJlZmVy
ZW5jZWQgaW4gb25lIHBsYWNlIHdoZXJlCj4gaXMgd2FzIGNvcGllZCBidXQgbmV2ZXIgYXNzaWdu
ZWQuCj4KPiBEcm9wIHRoZSBjb3B5IGFuZCBkcm9wIHRoZSBmaWVsZCBpbiBkcm1fZGlzcGxheV9t
b2RlLgo+IEFkanVzdCB0aGUgY29tbWVudCBvZiBwcml2YXRlX2ZsYWdzIGFzIGlzIHJlZmVycmVk
IHRvIHRoZSBjb21tZW50IGZvcgo+IHByaXZhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21p
dW0ub3JnPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+
Cj4gQWdhaW4sIHNvbWV0aGluZyBJIGp1c3Qgc3R1bWJsZWQgdXBvbi4KPiBJIGFsc28gY2hlY2tl
ZCBwcml2YXRlX2ZsYWdzIC0gaXQgaXMgdXNlZCBpbiBhIGZldyBtb2R1bGVzLgo+IEFuZCBpdCBs
b29rZWQgbGVnaXQuCj4KPiBCdWlsZCB0ZXN0ZWQgd2l0aCBhbGxtb2Rjb25maWcsIGFsbHllc2Nv
bmZpZywgYWxsbm9jb25maWcgZm9yIHJlbGV2YW50Cj4gYXJjaGl0ZWN0dXJlcy4KCklpcmMgaTkx
NSB1c2VkIHRoaXMsIGJlZm9yZSB3ZSB3ZW50IGZ1bGwgb3ZlcmRyaXZlIHdpdGggZW50aXJlIGF0
b21pYwpzdGF0ZSBzdHJ1Y3R1cmUgc3ViY2xhc3NpbmcgOi0pCgpSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4KPiAgICAgICAgIFNhbQo+Cj4KPiAg
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8ICAxIC0KPiAgaW5j
bHVkZS9kcm0vZHJtX21vZGVzLmggICAgICAgICAgICAgICAgICAgICB8IDExICsrLS0tLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+IGluZGV4IGY5
NmUxNDJjNDM2MS4uNjE5NzI2MWUyMmMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfZW5jb2Rlci5jCj4gQEAgLTUxNiw3ICs1MTYsNiBAQCBzdGF0aWMgdm9pZCBf
ZHB1X2VuY29kZXJfYWRqdXN0X21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwK
PiAgICAgICAgICAgICAgICAgaWYgKGN1cl9tb2RlLT52ZGlzcGxheSA9PSBhZGpfbW9kZS0+dmRp
c3BsYXkgJiYKPiAgICAgICAgICAgICAgICAgICAgIGN1cl9tb2RlLT5oZGlzcGxheSA9PSBhZGpf
bW9kZS0+aGRpc3BsYXkgJiYKPiAgICAgICAgICAgICAgICAgICAgIGRybV9tb2RlX3ZyZWZyZXNo
KGN1cl9tb2RlKSA9PSBkcm1fbW9kZV92cmVmcmVzaChhZGpfbW9kZSkpIHsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBhZGpfbW9kZS0+cHJpdmF0ZSA9IGN1cl9tb2RlLT5wcml2YXRlOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGFkal9tb2RlLT5wcml2YXRlX2ZsYWdzIHw9IGN1cl9tb2Rl
LT5wcml2YXRlX2ZsYWdzOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgK
PiBpbmRleCBlOTQ2ZTIwYzYxZDguLjk5MTM0ZDRmMzVlYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fbW9kZXMuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCj4gQEAgLTM3
MSwyMCArMzcxLDEzIEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHsKPiAgICAgICAgIGludCBj
cnRjX3Z0b3RhbDsKPgo+ICAgICAgICAgLyoqCj4gLSAgICAgICAgKiBAcHJpdmF0ZToKPiArICAg
ICAgICAqIEBwcml2YXRlX2ZsYWdzOgo+ICAgICAgICAgICoKPiAtICAgICAgICAqIFBvaW50ZXIg
Zm9yIGRyaXZlciBwcml2YXRlIGRhdGEuIFRoaXMgY2FuIG9ubHkgYmUgdXNlZCBmb3IgbW9kZQo+
ICsgICAgICAgICogRHJpdmVyIHByaXZhdGUgZmxhZ3MuIHByaXZhdGVfZmxhZ3MgY2FuIG9ubHkg
YmUgdXNlZCBmb3IgbW9kZQo+ICAgICAgICAgICogb2JqZWN0cyBwYXNzZWQgdG8gZHJpdmVycyBp
biBtb2Rlc2V0IG9wZXJhdGlvbnMuIEl0IHNob3VsZG4ndCBiZSB1c2VkCj4gICAgICAgICAgKiBi
eSBhdG9taWMgZHJpdmVycyBzaW5jZSB0aGV5IGNhbiBzdG9yZSBhbnkgYWRkaXRpb25hbCBkYXRh
IGJ5Cj4gICAgICAgICAgKiBzdWJjbGFzc2luZyBzdGF0ZSBzdHJ1Y3R1cmVzLgo+ICAgICAgICAg
ICovCj4gLSAgICAgICBpbnQgKnByaXZhdGU7Cj4gLQo+IC0gICAgICAgLyoqCj4gLSAgICAgICAg
KiBAcHJpdmF0ZV9mbGFnczoKPiAtICAgICAgICAqCj4gLSAgICAgICAgKiBTaW1pbGFyIHRvIEBw
cml2YXRlLCBidXQganVzdCBhbiBpbnRlZ2VyLgo+IC0gICAgICAgICovCj4gICAgICAgICBpbnQg
cHJpdmF0ZV9mbGFnczsKPgo+ICAgICAgICAgLyoqCj4gLS0KPiAyLjIwLjEKPgoKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
