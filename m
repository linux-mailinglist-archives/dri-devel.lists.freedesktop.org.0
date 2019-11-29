Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB910D32E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F7D6E895;
	Fri, 29 Nov 2019 09:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ECC6E895
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:23:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y5so14171277wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 01:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UPhMA7LtdzKZF/X+3+RVMQIE96DG76giXq9Ubgc8NuU=;
 b=mrHvl4nrQE9vKHYWMiYFuQ71pyQARlFRrgUu8ojhSFg5rjtQgiZfGu/4Oqr/9OYeeQ
 dFr4t4lj6oaKzy8GsrcfqmCTSm+0sOl5WHkZj2Z/4SIMeuzA/7C0r2GfgGmI6qEvme5a
 FB7jmGOIxu4J9ZzfyM7zujSrqer5CcDLOG2OKlMkDdu8FS86K7aAjs+ZoCCwd0P4KRNT
 qnjOeDolGdRqtddMafKMf5kziIBi7D3aQisQ7YFJFgpLD7VDr2Sgs0KJQph1ycPdWYMF
 wXESSCHtCE1v4vb1VM6eE5vHcE2vAvbyqRytI1W7FRw39ThSBebBdEPYuEwXusTV4mns
 C4cA==
X-Gm-Message-State: APjAAAUyjocXCUsEUNLsV88QUx9fvikfC6Ts1Xp3wW+RnW5RZAtQumY3
 Ilw6nlsv+p35zSDPKRZRS+3Vvw==
X-Google-Smtp-Source: APXvYqykcjxgG9Am1UrpLstCL2mUSTYo7aI4tATZN1BNOYGUWW1BELZB/f9WWEBWmD7KQylZBKYFHA==
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr13467534wme.30.1575019402206; 
 Fri, 29 Nov 2019 01:23:22 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b185sm387735wme.36.2019.11.29.01.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:23:21 -0800 (PST)
Date: Fri, 29 Nov 2019 10:23:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Message-ID: <20191129092319.GD624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-9-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-9-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UPhMA7LtdzKZF/X+3+RVMQIE96DG76giXq9Ubgc8NuU=;
 b=BombMQd90nM/pwQhyIN2iEc8mduaG+U83PWfD9tB1EFVNBcMs85duZtKHX0ln0P2Ax
 iiZi31wex7AN+lmley1gk17gJwMe6I4trzV3ZsC4h7YoeWx+c/Mae44KDt+aSwsaOqIq
 WP4FsEh7hxP/eV/ylaRwLb9dIp02Pge/2JF9M=
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

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6Mzc6NDBQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBF
bnN1cmUgdGhhdCBhIHJ1bnRpbWUgUE0gcmVmZXJlbmNlIGlzIGFjcXVpcmVkIGVhY2ggdGltZSB0
aGUgRFBBVVgKPiByZWdpc3RlcnMgYXJlIGFjY2Vzc2VkLiBPdGhlcndpc2UgdGhlIGNvZGUgbWF5
IGVuZCB1cCBydW5uaW5nIHdpdGhvdXQKPiB0aGUgY29udHJvbGxlciBiZWluZyBwb3dlcmVkLCBv
dXQtb2YtcmVzZXQgb3IgY2xvY2tlZCBpbiBzb21lIGNvcm5lcgo+IGNhc2VzLCByZXN1bHRpbmcg
aW4gYSBjcmFzaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgoKT24gcGF0Y2hlcyA0LDUsNyBpbiB0aGlzIHNlcmllcyBBY2tlZC1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCk9uIHRoaXMgb25lIGhlcmUgSSdt
IHZlcnkgY29uZnVzZWQuCgotIFdoeSBkbyB5b3UgZHJvcCB0aGUgcnVudGltZSBwbSBiZXR3ZWVu
IGVuYWJsZSBhbmQgZGlzYWJsZT8gSXMgdGhhdCBqdXN0CiAgaG93IHRoZSBodyB3b3JrcywgaS5l
LiB0aGUgcGFkIGNvbmZpZyBzdGF5cywganVzdCB0aGUgcmVnaXN0ZXJzIGdvIGF3YXk/CgotIEkn
bSBub3Qgc2VlaW5nIGFueSBsb2NraW5nIGJldHdlZW4gdGhlIGRpZmZlcmVudCB1c2VycyAoZHAg
YXV4IGFuZAogIHBpbmN0cmwpLiBXZSBtaWdodCB3YW50IHRvIGNoYW5nZSBkcm1fZHBfYXV4LT5o
d19tdXRleCB0byBhIHBvaW50ZXIgdG8KICBtYWtlIHRoaXMgZWFzaWVyIChidXQgSSdtIG5vdCBz
dXBlciBmb25kIG9mIHRoYXQgcGF0dGVybiBmcm9tIGkyYykuCgotIFlvdXIgZHJtX2RwX2F1eF9l
bmFibGUvZGlzYWJsZSBuZWVkcyB0byBiZSBtb3ZlZCBpbnRvIHRoZSAtPnRyYW5zZmVyCiAgY2Fs
bGJhY2ssIG90aGVyd2lzZSB0aGUgdmFyaW91cyB1c2Vyc3BhY2UgaW50ZXJmYWNlIChkcCBhdXgs
IGJ1dCBhbHNvCiAgaTJjIG9uIHRvcCBvZiB0aGF0KSB3b24ndCB3b3JrLiBTb21lIHByZS9wb3N0
X3RyYW5zZmVyIGZ1bmN0aW9ucyBsaWtlCiAgaTJjIGhhcyBtaWdodCBiZSB1c2VmdWwgZm9yIHN0
dWZmIGxpa2UgdGhpcy4KCkNoZWVycywgRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHBhdXguYyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kcGF1eC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMKPiBp
bmRleCA2MjJjZGYxYWQyNDYuLjRiMmI4NmFlZDFhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHBhdXguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5j
Cj4gQEAgLTQzNCw4ICs0MzQsMTMgQEAgc3RhdGljIGludCB0ZWdyYV9kcGF1eF9zZXRfbXV4KHN0
cnVjdCBwaW5jdHJsX2RldiAqcGluY3RybCwKPiAgCQkJICAgICAgIHVuc2lnbmVkIGludCBmdW5j
dGlvbiwgdW5zaWduZWQgaW50IGdyb3VwKQo+ICB7Cj4gIAlzdHJ1Y3QgdGVncmFfZHBhdXggKmRw
YXV4ID0gcGluY3RybF9kZXZfZ2V0X2RydmRhdGEocGluY3RybCk7Cj4gKwlpbnQgZXJyOwo+ICsK
PiArCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZHBhdXgtPmRldik7Cj4gKwllcnIgPSB0ZWdyYV9kcGF1
eF9wYWRfY29uZmlnKGRwYXV4LCBmdW5jdGlvbik7Cj4gKwlwbV9ydW50aW1lX3B1dChkcGF1eC0+
ZGV2KTsKPiAgCj4gLQlyZXR1cm4gdGVncmFfZHBhdXhfcGFkX2NvbmZpZyhkcGF1eCwgZnVuY3Rp
b24pOwo+ICsJcmV0dXJuIGVycjsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5t
dXhfb3BzIHRlZ3JhX2RwYXV4X3Bpbm11eF9vcHMgPSB7Cj4gQEAgLTgwOSwxNSArODE0LDIyIEBA
IGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgZHJtX2RwX2F1eF9kZXRlY3Qoc3RydWN0IGRybV9k
cF9hdXggKmF1eCkKPiAgaW50IGRybV9kcF9hdXhfZW5hYmxlKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgpCj4gIHsKPiAgCXN0cnVjdCB0ZWdyYV9kcGF1eCAqZHBhdXggPSB0b19kcGF1eChhdXgpOwo+
ICsJaW50IGVycjsKPiArCj4gKwlwbV9ydW50aW1lX2dldF9zeW5jKGRwYXV4LT5kZXYpOwo+ICsJ
ZXJyID0gdGVncmFfZHBhdXhfcGFkX2NvbmZpZyhkcGF1eCwgRFBBVVhfUEFEQ1RMX0ZVTkNfQVVY
KTsKPiArCXBtX3J1bnRpbWVfcHV0KGRwYXV4LT5kZXYpOwo+ICAKPiAtCXJldHVybiB0ZWdyYV9k
cGF1eF9wYWRfY29uZmlnKGRwYXV4LCBEUEFVWF9QQURDVExfRlVOQ19BVVgpOwo+ICsJcmV0dXJu
IGVycjsKPiAgfQo+ICAKPiAgaW50IGRybV9kcF9hdXhfZGlzYWJsZShzdHJ1Y3QgZHJtX2RwX2F1
eCAqYXV4KQo+ICB7Cj4gIAlzdHJ1Y3QgdGVncmFfZHBhdXggKmRwYXV4ID0gdG9fZHBhdXgoYXV4
KTsKPiAgCj4gKwlwbV9ydW50aW1lX2dldF9zeW5jKGRwYXV4LT5kZXYpOwo+ICAJdGVncmFfZHBh
dXhfcGFkX3Bvd2VyX2Rvd24oZHBhdXgpOwo+ICsJcG1fcnVudGltZV9wdXQoZHBhdXgtPmRldik7
Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
