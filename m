Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABC10D2FB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24CE6E0F5;
	Fri, 29 Nov 2019 09:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D426E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:10:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so34243748wro.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 01:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3aO97pOEtqkMLXTBXdj6G0lmfb+oABXgy4h9k+T807M=;
 b=lvrSZroD00pNMGaVZ80n1OnQ0NU+lNt5rNFjlyLOEfcadLdHBxxnBFMVzKOxR6FPRr
 u5qS0V96+fYb+MrNaDGBXNgmhlNOvBsC03rdvWpD0fe5pfDLis7nJNRMc5/efTCI6KKn
 cRrtvj3HIiNpIQ4fzRJAbEuAcF7x3LadGenr5iEOMKMvxEdoJqjV3zASywoOcIjZVMDn
 XrnIiXVg71rRNa9To6qxgrpoXAx4Hi41q/SgRjWA0W3ffAp7IDfSceBdrFbeKp0JvEqL
 EflgYdOo92EOD+qDWA9Th1NvzrIY/KhTybRdSaFXHAoo/ONIiN93q/vGee28Td5/1H1S
 A5tQ==
X-Gm-Message-State: APjAAAWDVTYo8t8gqfqHgSH67x4v+bubkIx05dwzg6U187+Ls8hhF6IP
 DoAUF+/VG7mzhWYcy/G9S1h5VA==
X-Google-Smtp-Source: APXvYqzGEf8G1x7Dhy9qTU57UhkfsnwYgA32AlmeHbS6vfJYoPkyrbQ2Fva6p5pr+5Hyt6P5dzGSdg==
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr52892635wrm.366.1575018641942; 
 Fri, 29 Nov 2019 01:10:41 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r15sm27703126wrc.5.2019.11.29.01.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:10:40 -0800 (PST)
Date: Fri, 29 Nov 2019 10:10:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/9] drm/tegra: gem: Properly pin imported buffers
Message-ID: <20191129091038.GB624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-3-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3aO97pOEtqkMLXTBXdj6G0lmfb+oABXgy4h9k+T807M=;
 b=bcuIAt40w7Xe+lNKwmpCMGbKkfRGr0dS/4VpGxF517qXp/4KEj6NYUdN/k4YRncu88
 Jlk1AUGRgZFnVO0fyOjYSJ0maj9NYu8On27yczLypuJvwmJxCk7gOvoLZC9AVWJYA///
 hjmf1XpNTCtfZmo1y38uuUgWhjAZ3QT4IPAPQ=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6Mzc6MzRQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBC
dWZmZXJzIHRoYXQgYXJlIGltcG9ydGVkIGZyb20gYSBETUEtQlVGIGRvbid0IGhhdmUgcGFnZXMg
YWxsb2NhdGVkIHdpdGgKPiB0aGVtLiBBdCB0aGUgc2FtZSB0aW1lIGFuIFNHIHRhYmxlIGZvciB0
aGVtIGNhbid0IGJlIGRlcml2ZWQgdXNpbmcgdGhlCj4gRE1BIEFQSSBoZWxwZXJzIGJlY2F1c2Ug
dGhlIG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiBkb2Vzbid0IGV4aXN0LiBIb3dldmVyCj4gdGhlcmUn
cyBhbHJlYWR5IGFuIFNHIHRhYmxlIHRoYXQgd2FzIGNyZWF0ZWQgZHVyaW5nIGltcG9ydCwgc28g
dGhpcyBjYW4KPiBzaW1wbHkgYmUgZHVwbGljYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZ2VtLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwo+IGlu
ZGV4IDc0NmRhZTMyYzQ4NC4uNmRmYWQ1NmVlZTJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwo+IEBA
IC0yNyw2ICsyNywyOSBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9ib19wdXQoc3RydWN0IGhvc3QxeF9i
byAqYm8pCj4gIAlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoJm9iai0+Z2VtKTsKPiAgfQo+
ICAKPiArLyogWFhYIG1vdmUgdGhpcyBpbnRvIGxpYi9zY2F0dGVybGlzdC5jPyAqLwo+ICtzdGF0
aWMgaW50IHNnX2FsbG9jX3RhYmxlX2Zyb21fc2coc3RydWN0IHNnX3RhYmxlICpzZ3QsIHN0cnVj
dCBzY2F0dGVybGlzdCAqc2csCj4gKwkJCQkgIHVuc2lnbmVkIGludCBuZW50cywgZ2ZwX3QgZ2Zw
X21hc2spCj4gK3sKPiArCXN0cnVjdCBzY2F0dGVybGlzdCAqZHN0Owo+ICsJdW5zaWduZWQgaW50
IGk7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWVyciA9IHNnX2FsbG9jX3RhYmxlKHNndCwgbmVudHMs
IGdmcF9tYXNrKTsKPiArCWlmIChlcnIgPCAwKQo+ICsJCXJldHVybiBlcnI7Cj4gKwo+ICsJZHN0
ID0gc2d0LT5zZ2w7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG5lbnRzOyBpKyspIHsKPiArCQlz
Z19zZXRfcGFnZShkc3QsIHNnX3BhZ2Uoc2cpLCBzZy0+bGVuZ3RoLCAwKTsKPiArCQlkc3QgPSBz
Z19uZXh0KGRzdCk7Cj4gKwkJc2cgPSBzZ19uZXh0KHNnKTsKPiArCX0KPiArCj4gKwlyZXR1cm4g
MDsKPiArfQo+ICsKPiAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqdGVncmFfYm9fcGluKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGhvc3QxeF9ibyAqYm8sCj4gIAkJCQkgICAgIGRtYV9hZGRy
X3QgKnBoeXMpCj4gIHsKPiBAQCAtNTIsMTEgKzc1LDMxIEBAIHN0YXRpYyBzdHJ1Y3Qgc2dfdGFi
bGUgKnRlZ3JhX2JvX3BpbihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBob3N0MXhfYm8gKmJv
LAo+ICAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ICAKPiAgCWlmIChvYmotPnBhZ2VzKSB7
Cj4gKwkJLyoKPiArCQkgKiBJZiB0aGUgYnVmZmVyIG9iamVjdCB3YXMgYWxsb2NhdGVkIGZyb20g
dGhlIGV4cGxpY2l0IElPTU1VCj4gKwkJICogQVBJIGNvZGUgcGF0aHMsIGNvbnN0cnVjdCBhbiBT
RyB0YWJsZSBmcm9tIHRoZSBwYWdlcy4KPiArCQkgKi8KPiAgCQllcnIgPSBzZ19hbGxvY190YWJs
ZV9mcm9tX3BhZ2VzKHNndCwgb2JqLT5wYWdlcywgb2JqLT5udW1fcGFnZXMsCj4gIAkJCQkJCTAs
IG9iai0+Z2VtLnNpemUsIEdGUF9LRVJORUwpOwo+ICAJCWlmIChlcnIgPCAwKQo+ICAJCQlnb3Rv
IGZyZWU7Cj4gKwl9IGVsc2UgaWYgKG9iai0+c2d0KSB7Cj4gKwkJLyoKPiArCQkgKiBJZiB0aGUg
YnVmZmVyIG9iamVjdCBhbHJlYWR5IGhhcyBhbiBTRyB0YWJsZSBidXQgbm8gcGFnZXMKPiArCQkg
KiB3ZXJlIGFsbG9jYXRlZCBmb3IgaXQsIGl0IG1lYW5zIHRoZSBidWZmZXIgd2FzIGltcG9ydGVk
IGFuZAo+ICsJCSAqIHRoZSBTRyB0YWJsZSBuZWVkcyB0byBiZSBjb3BpZWQgdG8gYXZvaWQgb3Zl
cndyaXRpbmcgYW55Cj4gKwkJICogb3RoZXIgcG90ZW50aWFsIHVzZXJzIG9mIHRoZSBvcmlnaW5h
bCBTRyB0YWJsZS4KPiArCQkgKi8KPiArCQllcnIgPSBzZ19hbGxvY190YWJsZV9mcm9tX3NnKHNn
dCwgb2JqLT5zZ3QtPnNnbCwgb2JqLT5zZ3QtPm5lbnRzLAo+ICsJCQkJCSAgICAgR0ZQX0tFUk5F
TCk7CgpXaHkgZHVwbGljYXRlIHRoaXMgaW5zdGVhZCBvZiBqdXN0IGhhbmRpbmcgb3V0IG9iai0+
c2d0LCBhbmQgdGhlbiBpbiB1bnBpbgptYWtpbmcgc3VyZSB5b3UgZG9uJ3QgcmVsZWFzZSBpdD8g
WW91IGNvdWxkIGFsc28gb25seSBtYXAvdW5tYXAgdGhlCmRtYV9idWYgaGVyZSBpbiB5b3VyIHBp
bi91bnBpbiwgYnV0IHRoYXQncyBhIHBpbGUgb2Ygd29yayBwbHVzIHRoZSBtYXBwaW5nCmlzIGNh
Y2hlZCBhbnl3YXkgc28gd29uJ3QgY2hhbmdlIGEgdGhpbmcuCi1EYW5pZWwKCj4gKwkJaWYgKGVy
ciA8IDApCj4gKwkJCWdvdG8gZnJlZTsKPiAgCX0gZWxzZSB7Cj4gKwkJLyoKPiArCQkgKiBJZiB0
aGUgYnVmZmVyIG9iamVjdCBoYWQgbm8gcGFnZXMgYWxsb2NhdGVkIGFuZCBpZiBpdCB3YXMKPiAr
CQkgKiBub3QgaW1wb3J0ZWQsIGl0IGhhZCB0byBiZSBhbGxvY2F0ZWQgd2l0aCB0aGUgRE1BIEFQ
SSwgc28KPiArCQkgKiB0aGUgRE1BIEFQSSBoZWxwZXIgY2FuIGJlIHVzZWQuCj4gKwkJICovCj4g
IAkJZXJyID0gZG1hX2dldF9zZ3RhYmxlKGRldiwgc2d0LCBvYmotPnZhZGRyLCBvYmotPmlvdmEs
Cj4gIAkJCQkgICAgICBvYmotPmdlbS5zaXplKTsKPiAgCQlpZiAoZXJyIDwgMCkKPiAtLSAKPiAy
LjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
