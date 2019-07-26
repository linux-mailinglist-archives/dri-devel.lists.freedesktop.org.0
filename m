Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C6770EE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 20:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1A46ECDB;
	Fri, 26 Jul 2019 18:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751F6ECDB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 18:06:24 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d17so53373064qtj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rLUGIIT5nu+gcpIoR2ae4+bd5ZpTwYKIydhE4xKy6jQ=;
 b=BCi7e51qBE9ED2w2m4JIzxHXuOwQ7jdvPJ1NqQnbCRbytaKxal4EUqw39V4wG/Alsx
 NWhUkyU9KYHg5Kc2B/Bucejxdp61FIF55muoYY6Kod29ZnbsxfdTlryCjM0fblwCv+AH
 QeXQAxP5DVsKVk2hbDGi7ar6qttD1QUGaQ+uatDhylnvbc8z3mY16GpK5NVsKJSqoKus
 hbiDakNSTCLzhxlsgOyAtkCXh0mn4NcPfVpiRW4Luvoj3/mgHUH0BqwfIV6qgmct8eFu
 MfjJx5DKULhlaEUvwZvJunscG3b88ewkpBAtDOzPSNJ7cQqELPStygRhNqkIG1X5GlMz
 PotA==
X-Gm-Message-State: APjAAAWhbkaUh9k1JqdTGXgEu9b4xJ8lBFSAyRrqafEyIqRsTXqS0Zy+
 cubHWk2rh0g+MJ9Eq/L2pOQ8dA==
X-Google-Smtp-Source: APXvYqxenFz9HI/5ZXXVDegdYZ3XXbnt+Y5d31tYocOTEZRjOIqyMLf/qrSWN3yB1UnjwpMhVTK5Ow==
X-Received: by 2002:ac8:1c54:: with SMTP id j20mr66355663qtk.158.1564164383854; 
 Fri, 26 Jul 2019 11:06:23 -0700 (PDT)
Received: from malachite.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id j6sm6279182qtl.85.2019.07.26.11.06.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 11:06:23 -0700 (PDT)
Message-ID: <5e1fe0eb25066ca078d06b13775fced37fd3a086.camel@redhat.com>
Subject: Re: [PATCH] drm/mst: Fix sphinx warnings in drm_dp_msg_connector
 register functions
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Date: Fri, 26 Jul 2019 14:06:20 -0400
In-Reply-To: <20190726142057.224121-1-sean@poorly.run>
References: <20190726142057.224121-1-sean@poorly.run>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
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
Cc: Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bGd0bQoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmks
IDIwMTktMDctMjYgYXQgMTA6MjAgLTA0MDAsIFNlYW4gUGF1bCB3cm90ZToKPiBGcm9tOiBTZWFu
IFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHdh
cm5pbmdzOgo+IAo+IC4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6MTU5
Mzogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uCj4gcGFyYW1ldGVyICdkcm1fY29ubmVjdG9yJyBk
ZXNjcmlwdGlvbiBpbgo+ICdkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyJwo+IC4u
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6MTYxMzogd2FybmluZzogRXhj
ZXNzIGZ1bmN0aW9uCj4gcGFyYW1ldGVyICdkcm1fY29ubmVjdG9yJyBkZXNjcmlwdGlvbiBpbgo+
ICdkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyJwo+IC4uL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6MTU5NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyCj4gb3IgbWVtYmVyICdjb25uZWN0b3InIG5vdCBkZXNjcmliZWQgaW4gJ2RybV9kcF9tc3Rf
Y29ubmVjdG9yX2xhdGVfcmVnaXN0ZXInCj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYzoxNjE0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIKPiBvciBtZW1iZXIg
J2Nvbm5lY3Rvcicgbm90IGRlc2NyaWJlZCBpbgo+ICdkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJs
eV91bnJlZ2lzdGVyJwo+IAo+IEZpeGVzOiA1NjI4MzZhMjY5ZTMgKCJkcm0vZHBfbXN0OiBFbmFi
bGUgcmVnaXN0cmF0aW9uIG9mIEFVWCBkZXZpY2VzIGZvciBNU1QKPiBwb3J0cyIpCj4gQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
Pgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IGQz
ZDVmYTVlNTBlMC4uODJhZGQ3MzZlMTdkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCj4gQEAgLTE1NzksNyArMTU3OSw3IEBAIHN0YXRpYyB2b2lkIGJ1aWxkX21zdF9w
cm9wX3BhdGgoY29uc3Qgc3RydWN0Cj4gZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCj4gIAo+ICAv
KioKPiAgICogZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcigpIC0gTGF0ZSBNU1Qg
Y29ubmVjdG9yIHJlZ2lzdHJhdGlvbgo+IC0gKiBAZHJtX2Nvbm5lY3RvcjogVGhlIE1TVCBjb25u
ZWN0b3IKPiArICogQGNvbm5lY3RvcjogVGhlIE1TVCBjb25uZWN0b3IKPiAgICogQHBvcnQ6IFRo
ZSBNU1QgcG9ydCBmb3IgdGhpcyBjb25uZWN0b3IKPiAgICoKPiAgICogSGVscGVyIHRvIHJlZ2lz
dGVyIHRoZSByZW1vdGUgYXV4IGRldmljZSBmb3IgdGhpcyBNU1QgcG9ydC4gRHJpdmVycwo+IHNo
b3VsZAo+IEBAIC0xNjAxLDcgKzE2MDEsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfY29u
bmVjdG9yX2xhdGVfcmVnaXN0ZXIpOwo+ICAKPiAgLyoqCj4gICAqIGRybV9kcF9tc3RfY29ubmVj
dG9yX2Vhcmx5X3VucmVnaXN0ZXIoKSAtIEVhcmx5IE1TVCBjb25uZWN0b3IKPiB1bnJlZ2lzdHJh
dGlvbgo+IC0gKiBAZHJtX2Nvbm5lY3RvcjogVGhlIE1TVCBjb25uZWN0b3IKPiArICogQGNvbm5l
Y3RvcjogVGhlIE1TVCBjb25uZWN0b3IKPiAgICogQHBvcnQ6IFRoZSBNU1QgcG9ydCBmb3IgdGhp
cyBjb25uZWN0b3IKPiAgICoKPiAgICogSGVscGVyIHRvIHVucmVnaXN0ZXIgdGhlIHJlbW90ZSBh
dXggZGV2aWNlIGZvciB0aGlzIE1TVCBwb3J0LCByZWdpc3RlcmVkCj4gYnkKLS0gCkNoZWVycywK
CUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
