Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F8F1CC7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F346E09F;
	Wed,  6 Nov 2019 17:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC00B6E09F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:50:07 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id e13so4385713ybh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 09:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pnUBRgKGpjKO7kCszZSlQeEpPb7OXbystXXoDJFSwJA=;
 b=YHLCePZLzlAaJSiqaszCLNoxiMMIbYdqaBdD7G1sttp4N0stuTF0RVGViHErBdFB9B
 MPKH/lefoscSQvWLLAEphx9V1RAFF2JRlWDDYgJ7IcLB64tTb6h0zXyxTGsp1yidMk8C
 MTNYRYZHzcd643Kvv9iyFSouomkBkezW2YGCSeZUz2hfGNYQKyiWahRBOgRK9MZJzSW1
 HldYPOrtEZJlQWAWYnKxqzD2c/Q03I7qoce8Ub7fn3GOVpz6URklzwWo87QdlOIF1AUQ
 vex2+Q9HZ0/Q1FbTZ/QpsHICdYmJ99M4ppCcYHvWKZuUU6vEDrvlIoGOY/yXj2Xq64xk
 57iA==
X-Gm-Message-State: APjAAAU9Byzmui5lOkOA/FnzambFPX9lS/cNdrv+OxzXcvETygY602FE
 AU15wTp4GcLfYcEEc90KOzkWOg==
X-Google-Smtp-Source: APXvYqw+gLEOdqD3BGaqJzA58tlQG7inMwqQ72KjYwnzliF3VDpsut/fOZXmR7VynZPKdoaADcLayA==
X-Received: by 2002:a25:8103:: with SMTP id o3mr3095536ybk.215.1573062607030; 
 Wed, 06 Nov 2019 09:50:07 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x201sm25680172ywx.34.2019.11.06.09.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 09:50:06 -0800 (PST)
Date: Wed, 6 Nov 2019 12:50:05 -0500
From: Sean Paul <sean@poorly.run>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/shmem: Add docbook comments for drm_gem_shmem_object
 madvise fields
Message-ID: <20191106175005.GC63329@art_vandelay>
References: <20191101153754.22803-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101153754.22803-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pnUBRgKGpjKO7kCszZSlQeEpPb7OXbystXXoDJFSwJA=;
 b=c3r/D2eGcLFBnoEzXaj7WgMoPnV86p3/3B/gBoNpwYGzUBSTpQ4k1CzJ0YZTuAYe5s
 /6Y0vlwLVh3Am/hmgwX6rwh2jGqSqugz+VNxbREZXhkQ7emgl+NrstqhGQzg9Oz8wZHn
 PgkRSA6q/CExOsRQaHgIZdBDOeqUORHKu3Q8AbQMfkQKGF95TeiD1gqph177rr50oWtL
 Vspes3OuviCX5mrAQzOCkPHh6YyXOlrEfkMBEjj5DO7/71Ke+b/US2ELo8OxhJfGhMii
 yLPRpeZwJVpYb6sVtgk3D+UKxiXSWi5xTRYxLCzjYIKQwslv3pM/vJFrdvizFdj5w8LU
 eZzQ==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMTA6Mzc6NTRBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gQWRkIG1pc3NpbmcgZG9jYm9vayBjb21tZW50cyB0byBtYWR2aXNlIGZpZWxkcyBpbiBz
dHJ1Y3QKPiBkcm1fZ2VtX3NobWVtX29iamVjdCB3aGljaCBmaXhlcyB0aGVzZSB3YXJuaW5nczoK
PiAKPiBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oOjg3OiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtYWR2JyBub3QgZGVzY3JpYmVkIGluICdkcm1fZ2Vt
X3NobWVtX29iamVjdCcKPiBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oOjg3OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtYWR2X2xpc3QnIG5vdCBkZXNj
cmliZWQgaW4gJ2RybV9nZW1fc2htZW1fb2JqZWN0Jwo+IAo+IEZpeGVzOiAxN2FjYjlmMzVlZDcg
KCJkcm0vc2htZW06IEFkZCBtYWR2aXNlIHN0YXRlIGFuZCBwdXJnZSBoZWxwZXJzIikKPiBSZXBv
cnRlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CgpSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmggfCAxMyArKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgg
Yi9pbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oCj4gaW5kZXggZTJlOTk0N2I0Nzcw
Li45MDFlYWZiMDkyMDkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9o
ZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgKPiBAQCAt
NDQsNyArNDQsMjAgQEAgc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IHsKPiAgCSAqLwo+ICAJ
dW5zaWduZWQgaW50IHBhZ2VzX3VzZV9jb3VudDsKPiAgCj4gKwkvKioKPiArCSAqIEBtYWR2OiBT
dGF0ZSBmb3IgbWFkdmlzZQo+ICsJICoKPiArCSAqIDAgaXMgYWN0aXZlL2ludXNlLgo+ICsJICog
QSBuZWdhdGl2ZSB2YWx1ZSBpcyB0aGUgb2JqZWN0IGlzIHB1cmdlZC4KPiArCSAqIFBvc2l0aXZl
IHZhbHVlcyBhcmUgZHJpdmVyIHNwZWNpZmljIGFuZCBub3QgdXNlZCBieSB0aGUgaGVscGVycy4K
PiArCSAqLwo+ICAJaW50IG1hZHY7Cj4gKwo+ICsJLyoqCj4gKwkgKiBAbWFkdl9saXN0OiBMaXN0
IGVudHJ5IGZvciBtYWR2aXNlIHRyYWNraW5nCj4gKwkgKgo+ICsJICogVHlwaWNhbGx5IHVzZWQg
YnkgZHJpdmVycyB0byB0cmFjayBwdXJnZWFibGUgb2JqZWN0cwo+ICsJICovCj4gIAlzdHJ1Y3Qg
bGlzdF9oZWFkIG1hZHZfbGlzdDsKPiAgCj4gIAkvKioKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApT
ZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
