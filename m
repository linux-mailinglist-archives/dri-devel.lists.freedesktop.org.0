Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75852E574
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 21:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476B6E0B0;
	Wed, 29 May 2019 19:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11C6E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 19:36:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m4so5416800edd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 12:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ppBQ8BBcsrs19CgDW0jBP7VifaHbICNJbOpiAtMdZ7w=;
 b=GIKVhfnhtwyiAwEBr5M3iScQgxQZtaV1JFT+xY4pPeeZjuPFfB9O6z/CTdbR/1tNGw
 SPvb88gQ7xA9dwi1YhzZTFkumyl5Lr4dm8N0o4OSqY1H4boLddMfVj9dgSGPJhZnITKj
 Ka5EzHstS7Ef5n2bmDmkqdWW4eJNIjn0WAEltC7/FqOZGCeZF2ov4OEUBj36lbP2aiFD
 EPHJWPPZMh8FDReURY9T6+AfY0vRhGUDLxBqzXcCI0Kh9Ds9wlgYEJFBcWYKpBUfgfB3
 SnVYlA+bHoq4mxLUVr7doK8hnP6pSi4B9nc6El/LlGFtODTGMT7bcDuXDQX52GPMOh1b
 cZQg==
X-Gm-Message-State: APjAAAWEW1XNWawzw3BQCw9NeqqoG5I5iXUygafqB38s3SOefuS/37y8
 J+Zhj0byCGUNjvK9v9rgiIs7nnW9Owk=
X-Google-Smtp-Source: APXvYqy42LzV7wkvIdQ9rMMGXEouc1WQAXid5A+DmtTamhBjbJlmsKcxNeFYyjC5F9qLtJ4OaASSdw==
X-Received: by 2002:a50:be03:: with SMTP id a3mr137947461edi.5.1559158578464; 
 Wed, 29 May 2019 12:36:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s11sm97833edx.41.2019.05.29.12.36.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 12:36:17 -0700 (PDT)
Date: Wed, 29 May 2019 21:36:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
Message-ID: <20190529193615.GX21222@phenom.ffwll.local>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
 <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ppBQ8BBcsrs19CgDW0jBP7VifaHbICNJbOpiAtMdZ7w=;
 b=WDwtLHMiOc10n7rwrhTBuPSDqATt8jX3q1eQuffINMFPYBxrzkE3xFVs+jFXwl20+U
 CP+NISpaEy7ruPpQ1iIBHkjcPRVZqk7Bw+qwbBuXv+p+gP6OsZ9IkYm5u7yLWO8zWPcf
 /UBnGJnyArEdy1puYjg+vFFBhvYvPpcG6lgxw=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDQ6NDM6NDVQTSArMDAwMCwgR3JvZHpvdnNreSwgQW5k
cmV5IHdyb3RlOgo+IEkgZG9uJ3QsIHNvcnJ5LgoKU2hvdWxkIHdlIGZpeCB0aGF0PyBTZWVtcyBs
aWtlIHlvdSBkbyBwbGVudHkgb2Ygc2NoZWR1bGVyIHN0dWZmLCBzbyB3b3VsZAptYWtlIHNlbnNl
IEkgZ3Vlc3MgLi4uCi1EYW5pZWwKCj4gCj4gQW5kcmV5Cj4gCj4gT24gNS8yOS8xOSAxMjo0MiBQ
TSwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6Mjkg
QU0gQW5kcmV5IEdyb2R6b3Zza3kKPiA+IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPiB3cm90
ZToKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Cj4gPgo+ID4gSSdsbCBwdXNoIGl0IHRvIGRybS1taXNjIGluIGEgbWludXRl
IHVubGVzcyB5b3UgaGF2ZSBjb21taXQgcmlnaHRzLgo+ID4KPiA+IEFsZXgKPiA+Cj4gPj4gLS0t
Cj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDIgKysKPiA+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gPj4gaW5kZXggNDllN2QwNy4uYzEwNThlZSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gPj4gQEAgLTM1
Myw2ICszNTMsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSk7Cj4g
Pj4gICAgKiBkcm1fc2NoZWRfc3RvcCAtIHN0b3AgdGhlIHNjaGVkdWxlcgo+ID4+ICAgICoKPiA+
PiAgICAqIEBzY2hlZDogc2NoZWR1bGVyIGluc3RhbmNlCj4gPj4gKyAqIEBiYWQ6IGpvYiB3aGlj
aCBjYXVzZWQgdGhlIHRpbWUgb3V0Cj4gPj4gICAgKgo+ID4+ICAgICogU3RvcCB0aGUgc2NoZWR1
bGVyIGFuZCBhbHNvIHJlbW92ZXMgYW5kIGZyZWVzIGFsbCBjb21wbGV0ZWQgam9icy4KPiA+PiAg
ICAqIE5vdGU6IGJhZCBqb2Igd2lsbCBub3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUgdXNlZCBs
YXRlciBhbmQgc28gaXQncwo+ID4+IEBAIC00MjIsNiArNDIzLDcgQEAgRVhQT1JUX1NZTUJPTChk
cm1fc2NoZWRfc3RvcCk7Cj4gPj4gICAgKiBkcm1fc2NoZWRfam9iX3JlY292ZXJ5IC0gcmVjb3Zl
ciBqb2JzIGFmdGVyIGEgcmVzZXQKPiA+PiAgICAqCj4gPj4gICAgKiBAc2NoZWQ6IHNjaGVkdWxl
ciBpbnN0YW5jZQo+ID4+ICsgKiBAZnVsbF9yZWNvdmVyeTogcHJvY2VlZCB3aXRoIGNvbXBsZXRl
IHNjaGVkIHJlc3RhcnQKPiA+PiAgICAqCj4gPj4gICAgKi8KPiA+PiAgIHZvaWQgZHJtX3NjaGVk
X3N0YXJ0KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQsIGJvb2wgZnVsbF9yZWNvdmVy
eSkKPiA+PiAtLQo+ID4+IDIuNy40Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
