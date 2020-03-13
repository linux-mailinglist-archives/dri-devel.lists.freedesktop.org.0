Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF9184FE3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 21:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E026EC5B;
	Fri, 13 Mar 2020 20:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056C6EC52;
 Fri, 13 Mar 2020 20:05:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a25so13688820wrd.0;
 Fri, 13 Mar 2020 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H06rmW1/h+wDAsSD+e9fhzMuZrpU0IMfQUePRjRdDAs=;
 b=vSxW34N/nTt737dx/Ruyo6Noe+DuLJW4yxyH1BO/fvtxpJtt/WnDCLLRb2iyjizMCJ
 J0tUVWw3rF3dqGWiyyl7CqwX7D2s1XdYRWKPOUyB6x611f+ptTLdm7eL0wYBZ/wR0xLK
 SF2MCPkFBEZq78ILuDw16zNhE3Y8j3Gye/GF9+SBx3mhjiaJTLGSycAQvIB3JTWpwWJw
 Sl0U7d+AD5pcHpEwuWjBOkK4MfM2ncmeOBSFtv5V374IBCBOKv52KgM9bYzvkc177z+0
 fvYgrqhHwfQsTUYezNqiPbNu4Ju824Y/Vait1Hflqo3EfExXMxqiwL4GWaOO/3sxfBxY
 LeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H06rmW1/h+wDAsSD+e9fhzMuZrpU0IMfQUePRjRdDAs=;
 b=YXsmWCXFcYETz3pfoJKkiG4qTk9+rYF6RLeysjdhbAYUmDHTzVB0lj/BVnkvztweIm
 5K5fcwf2mYjkx0EYC95AKENzxqlxJ9DUcYn7pgOVvfa9rcfe0FM7k6HSO4jKdUVwV2vb
 ewUhIf3RpEVLhmLo6iT7MHspvG5zQZOrY3+Sr3KZxbmgb+PF7idCPTLgV5nF4iLWLSED
 66h8V5tqKI6cOUG3OOadrY760KIEd3ofsl+dlJg+6/BrPmCwdO4RHO8Y6+/LmnohJn51
 LByiUShyosvqp9ZzEeTPLInjo6YUdSdEExCpbo1otkGgCbePpcARTOjkJN4glBj+xVHh
 8ufQ==
X-Gm-Message-State: ANhLgQ1oVApv74pbJGDhUYRQz50y4jPhYizQgJ+thxbDaLYQNttNBk0q
 pVv0fCizDyZ+iAaNwX14sMScCzWjhCX15IgYdGyHrA==
X-Google-Smtp-Source: ADFU+vtt6sGS1SESoNiaUvQKq/C+U4e5vsrMG/aND6Tvciab7HyceykbfjgALYfFTYAwWHvlBYtAQKz+iePFInNy5jw=
X-Received: by 2002:adf:c5c8:: with SMTP id v8mr15025869wrg.111.1584129911796; 
 Fri, 13 Mar 2020 13:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
 <20200313162054.16009-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20200313162054.16009-2-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Mar 2020 16:05:00 -0400
Message-ID: <CADnq5_OsVawW3RV+8UhSf-wF0eG4Tp-fOMzsuLfJGJj_aPu-HA@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm: Constify topology id
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTMsIDIwMjAgYXQgMTI6MjEgUE0gVmlsbGUgU3lyamFsYQo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IE1ha2UgdGhlIHRvcG9sb2d5IGlkIGNv
bnN0IHNpbmNlIHdlIGRvbid0IHdhbnQgdG8gY2hhbmdlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNlcmllcyBp
czoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA0ICsrLS0KPiAgaW5j
bHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
Ywo+IGluZGV4IDY0NGYwYWQxMDY3MS4uNDYyZDhjYWE2ZTcyIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bm5lY3Rvci5jCj4gQEAgLTIzOTIsNyArMjM5Miw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX21vZGVf
cHV0X3RpbGVfZ3JvdXApOwo+ICAgKiB0aWxlIGdyb3VwIG9yIE5VTEwgaWYgbm90IGZvdW5kLgo+
ICAgKi8KPiAgc3RydWN0IGRybV90aWxlX2dyb3VwICpkcm1fbW9kZV9nZXRfdGlsZV9ncm91cChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2hhciB0b3BvbG9neVs4XSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgdG9wb2xvZ3lbOF0pCj4gIHsKPiAg
ICAgICAgIHN0cnVjdCBkcm1fdGlsZV9ncm91cCAqdGc7Cj4gICAgICAgICBpbnQgaWQ7Cj4gQEAg
LTI0MjIsNyArMjQyMiw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX21vZGVfZ2V0X3RpbGVfZ3JvdXAp
Owo+ICAgKiBuZXcgdGlsZSBncm91cCBvciBOVUxMLgo+ICAgKi8KPiAgc3RydWN0IGRybV90aWxl
X2dyb3VwICpkcm1fbW9kZV9jcmVhdGVfdGlsZV9ncm91cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hh
ciB0b3BvbG9neVs4XSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgdG9wb2xvZ3lbOF0pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBk
cm1fdGlsZV9ncm91cCAqdGc7Cj4gICAgICAgICBpbnQgcmV0Owo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBp
bmRleCAxOWFlNmJiNWM4NWIuLmZkNTQzZDFkYjliMiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fY29ubmVjdG9yLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBA
QCAtMTYxNyw5ICsxNjE3LDkgQEAgc3RydWN0IGRybV90aWxlX2dyb3VwIHsKPiAgfTsKPgo+ICBz
dHJ1Y3QgZHJtX3RpbGVfZ3JvdXAgKmRybV9tb2RlX2NyZWF0ZV90aWxlX2dyb3VwKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjaGFyIHRvcG9sb2d5WzhdKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgdG9wb2xvZ3lbOF0pOwo+ICBzdHJ1
Y3QgZHJtX3RpbGVfZ3JvdXAgKmRybV9tb2RlX2dldF90aWxlX2dyb3VwKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjaGFyIHRvcG9sb2d5WzhdKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgdG9wb2xvZ3lbOF0pOwo+ICB2b2lkIGRybV9tb2RlX3B1
dF90aWxlX2dyb3VwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZHJtX3RpbGVfZ3JvdXAgKnRnKTsKPgo+IC0tCj4gMi4yNC4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
