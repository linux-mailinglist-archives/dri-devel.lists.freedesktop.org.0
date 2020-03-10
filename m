Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5918072B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 19:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6326E8C7;
	Tue, 10 Mar 2020 18:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F826E8C7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 18:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583865826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpOF2yrKQKjDjatW5dGaT/ckyfMIb9r2mvdzhAGR3r0=;
 b=Yrt4trEvvfCkldiEhT5zTkeH+Ez4cNrbfTPKTC4v8MAG8COHPbNp7kA0vQ2QV0VQ3jjLHU
 QYYe8TtVTsjuH4LSypf8QpU7ZPf8RUNggBgVeorIZnPofStzJrrVprps5pPd7FcGbWCxjz
 HVTC2UCOPYkjWrCa2Tpk0JJu8Y5+pm4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-fernr0jZO4qUsj2YL2xn-g-1; Tue, 10 Mar 2020 14:43:43 -0400
X-MC-Unique: fernr0jZO4qUsj2YL2xn-g-1
Received: by mail-qt1-f197.google.com with SMTP id j35so9756631qte.19
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 11:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/DpR2+rDRm/5siffJtWBBI9nbBmh//iyJt6PJfdkXrk=;
 b=T8+w05mOt1BmAOTTsXUPQ39QcEvqCc1v/D9CvrrNCtLx4stXgZSICGb/KsIGgA4Npp
 SsJjGNNIs70GpBhxwok0W2n2V/8wRgnZMWDhEP7zhCRtbgv6FmYSIuB/ocn8hYMitQWO
 O7crRtr6PUmUtEmUIysTeRXdiMwjy/crX/+AK2GJ3MjZSEmCwgRplr4kOSh9QgoRUaHU
 ELWlBUJHTso3zjlOkK3zQ88s18qVqfswKKhs/Qf7C0+XHrwPwWaAgi/BlLidURywhuxs
 EdhoMCypsp2AC3UW9+tZMTqQJWkLaCSGvAGDLmu1wP1qtDx2zC8a3dnEVfW33NDMXo5v
 huFA==
X-Gm-Message-State: ANhLgQ2sCe2lZ1AFatJ2Mgy3xGmaoiop3sob3ULNhKkZIAW2NGZqhmbz
 alI/FIne5Drkrf9H5RAhZtiJDfitINaDq54W5yGPZOe5+zAXV/RL01N47ZB4KXklbytOwdWo3/l
 8vYlIBb7Lj3KLyH+yc3ouK6sYDcKu
X-Received: by 2002:a37:5c9:: with SMTP id 192mr21570883qkf.103.1583865822631; 
 Tue, 10 Mar 2020 11:43:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsSZqFX3FEhejcb1/uccPf30JOj4XcmJWeGyzmJm+MgbADKlbO5BpXSG6UdLpMUnjzhVGxUtg==
X-Received: by 2002:a37:5c9:: with SMTP id 192mr21570854qkf.103.1583865822404; 
 Tue, 10 Mar 2020 11:43:42 -0700 (PDT)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id d73sm6419455qkg.113.2020.03.10.11.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 11:43:41 -0700 (PDT)
Message-ID: <b336c114f09cfe79824c4fe0b33960f80edd00b1.camel@redhat.com>
Subject: Re: [PATCH] drm/i915/mst: Hookup DRM DP MST
 late_register/early_unregister callbacks
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Tue, 10 Mar 2020 14:43:40 -0400
In-Reply-To: <20200310184220.GO13686@intel.com>
References: <20200310182856.1587752-1-lyude@redhat.com>
 <20200310184220.GO13686@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTAzLTEwIGF0IDIwOjQyICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDI6Mjg6NTRQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IGk5MTUgY2FuIGVuYWJsZSBhdXggZGV2aWNlIG5vZGVzIGZvciBEUCBNU1QgYnkg
Y2FsbGluZwo+ID4gZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcigpL2RybV9kcF9t
c3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIKPiA+ICgpLAo+ID4gc28gbGV0J3MgaG9vayB0
aGF0IHVwLgo+IAo+IE9oLCB3ZSBkaWRuJ3QgaGF2ZSB0aGF0IHlldD8gSSB0aG91Z2h0IGl0IGdv
dCBob29rZWQgdXAgZm9yIGV2ZXJ5b25lCj4gYnV0IEkgZ3Vlc3Mgbm90Lgo+IAo+ID4gQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWFu
YXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KPiA+IENjOiAiTGVlLCBTaGF3
biBDIiA8c2hhd24uYy5sZWVAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfbXN0LmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+ID4gaW5kZXgg
ZDUzOTc4ZWQzYzEyLi5iY2ZmMmUwNmVhZDYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCj4gPiBAQCAtNTQ4LDEyICs1NDgsMzAgQEAgc3Rh
dGljIGludCBpbnRlbF9kcF9tc3RfZ2V0X2RkY19tb2RlcyhzdHJ1Y3QKPiA+IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcikKPiA+ICAJcmV0dXJuIHJldDsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGlj
IGludAo+ID4gK2ludGVsX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4gK3sKPiA+ICsJc3RydWN0IGludGVsX2Nvbm5lY3Rv
ciAqaW50ZWxfY29ubmVjdG9yID0KPiA+IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwo+
ID4gKwo+ID4gKwlyZXR1cm4gZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3Rlcihjb25u
ZWN0b3IsCj4gPiArCQkJCQkJICBpbnRlbF9jb25uZWN0b3ItPnBvcnQpOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgdm9pZAo+ID4gK2ludGVsX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdp
c3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4gK3sKPiA+ICsJc3RydWN0
IGludGVsX2Nvbm5lY3RvciAqaW50ZWxfY29ubmVjdG9yID0KPiA+IHRvX2ludGVsX2Nvbm5lY3Rv
cihjb25uZWN0b3IpOwo+ID4gKwo+ID4gKwlkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJl
Z2lzdGVyKGNvbm5lY3RvciwKPiA+ICsJCQkJCSAgICAgIGludGVsX2Nvbm5lY3Rvci0+cG9ydCk7
Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5j
cyBpbnRlbF9kcF9tc3RfY29ubmVjdG9yX2Z1bmNzID0gewo+ID4gIAkuZmlsbF9tb2RlcyA9IGRy
bV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcywKPiA+ICAJLmF0b21pY19nZXRf
cHJvcGVydHkgPSBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5LAo+
ID4gIAkuYXRvbWljX3NldF9wcm9wZXJ0eSA9IGludGVsX2RpZ2l0YWxfY29ubmVjdG9yX2F0b21p
Y19zZXRfcHJvcGVydHksCj4gPiAtCS5sYXRlX3JlZ2lzdGVyID0gaW50ZWxfY29ubmVjdG9yX3Jl
Z2lzdGVyLAo+IAo+IER1bm5vIGlmIHdlIHdhbnQgdG8gbG9zZSB0aGUgZXJyb3IgaW5qZWN0aW9u
Li4uCgpHb3RjaGEsIHdpbGwgc2VuZCBvdXQgYSBmaXhlZCByZXNwaW4gaW4ganVzdCBhIG1vbWVu
dAo+IAo+ID4gLQkuZWFybHlfdW5yZWdpc3RlciA9IGludGVsX2Nvbm5lY3Rvcl91bnJlZ2lzdGVy
LAo+ID4gKwkubGF0ZV9yZWdpc3RlciA9IGludGVsX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdp
c3RlciwKPiA+ICsJLmVhcmx5X3VucmVnaXN0ZXIgPSBpbnRlbF9kcF9tc3RfY29ubmVjdG9yX2Vh
cmx5X3VucmVnaXN0ZXIsCj4gPiAgCS5kZXN0cm95ID0gaW50ZWxfY29ubmVjdG9yX2Rlc3Ryb3ks
Cj4gPiAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl9kZXN0cm95X3N0YXRlLAo+ID4gIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGludGVsX2Rp
Z2l0YWxfY29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwKPiA+IC0tIAo+ID4gMi4yNC4xCi0tIApD
aGVlcnMsCglMeXVkZSBQYXVsIChzaGUvaGVyKQoJQXNzb2NpYXRlIFNvZnR3YXJlIEVuZ2luZWVy
IGF0IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
