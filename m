Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63B56BFB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B136E44E;
	Wed, 26 Jun 2019 14:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94AC6E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:31:21 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so3708859edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=8jSHFVOPtNSE5N12j6xz0Vuf4SLNfGLGUS6SXt+N8OM=;
 b=MS12hUiBbQbAZsUYaLNmby4T8YOrxEJFT8ml7zVZALqOROfJIS0+lHJMOWHqCkEOp5
 gk5R+loC80G4GCQj/8rbyS+fFQYFSTrnKsTsCDEbnJ6gTZ4/T87uMop632u3sacIarkl
 R+8ox6L07XCOQ5ZDSDs9v8v47KdYaheqGAP+R3eez7azGybwz1DdRMhRDuPUx61Z0WH0
 fVlaNMOR+zlaJ4U57kkWltaUC2GaMAXkL/UdQ5h1EenznomOZY2PKGt2jn1GvarGoDfj
 vsCAo9yhJNRXfbDahX+VuUAZ2CLa35cx4RbfmUYnPK+KSwv7S5Hy7auS6PihmUrEM91a
 ERSg==
X-Gm-Message-State: APjAAAXGb3rfpA9YuCuv2+R/qMk9UoEN1VfaeJEcN090VvqK/SEzUP7S
 /RVpVBPf64iCftsokILY7CAR//BgZPw=
X-Google-Smtp-Source: APXvYqxt1fU0FCAZU+JyVvurpZ4nQ++90og+hAl2bhIbTLYM9hWgfU0XzCtCZxJ2IfzWTgFiOkVTtw==
X-Received: by 2002:a50:84e2:: with SMTP id 89mr5707120edq.218.1561559480596; 
 Wed, 26 Jun 2019 07:31:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z2sm3006054ejp.73.2019.06.26.07.31.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 07:31:19 -0700 (PDT)
Date: Wed, 26 Jun 2019 16:31:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/connector: Allow max possible encoders
 to attach to a connector
Message-ID: <20190626143117.GO12905@phenom.ffwll.local>
References: <20190625234045.31321-1-dhinakaran.pandiyan@intel.com>
 <20190626134328.GQ5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626134328.GQ5942@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=8jSHFVOPtNSE5N12j6xz0Vuf4SLNfGLGUS6SXt+N8OM=;
 b=ipotWJB9ces/wAnrobFeN4KMjJbCWZkaLNK3dYFDHWXHEYUNAKiu0qOFWq1iU20ivY
 uBTp8lLBFM31wkVo+cdYDGUZ0g57KEyr1EbAxmPa7XnI7RdC3UbEHMqXopIE/R6x902S
 aY5p7PBexcYUUKL8Q+MToq8fQfL4g1ou6cqVU=
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
Cc: intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6NDM6MjhQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA0OjQwOjQ1UE0gLTA3MDAsIERoaW5h
a2FyYW4gUGFuZGl5YW4gd3JvdGU6Cj4gPiBDdXJyZW50bHkgd2UgcmVzdHJpY3QgdGhlIG51bWJl
ciBvZiBlbmNvZGVycyB0aGF0IGNhbiBiZSBsaW5rZWQgdG8KPiA+IGEgY29ubmVjdG9yIHRvIDMs
IGluY3JlYXNlIGl0IHRvIG1hdGNoIHRoZSBtYXhpbXVtIG51bWJlciBvZiBlbmNvZGVycwo+ID4g
dGhhdCBjYW4gYmUgaW5pdGlhbGl6ZWQgLSAzMi4gVGhlIGN1cnJlbnQgbGltaXRhdGlvbiBsb29r
cyBhcnRpZmljaWFsLgo+ID4gSW5jcmVhc2luZyB0aGUgbGltaXQgdG8gMzIgZG9lcyBob3dldmVy
IGluY3JlYXNlcyB0aGUgc2l6ZSBvZiB0aGUgc3RhdGljCj4gPiB1MzIgYXJyYXkga2VlcGluZyB0
cmFjayBvZiB0aGUgZW5jb2RlciBJRHMuCj4gPiAKPiA+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2Fy
YW4ucGFuZGl5YW5AaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5l
Y3Rvci5oIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiBpbmRleCBjYTc0NWQ5ZmVhZjUuLjkx
NDU1YjRhOTM2MCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+
ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiBAQCAtMTI3OCw3ICsxMjc4
LDcgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igewo+ID4gIAkvKiogQG92ZXJyaWRlX2VkaWQ6IGhh
cyB0aGUgRURJRCBiZWVuIG92ZXJ3cml0dGVuIHRocm91Z2ggZGVidWdmcyBmb3IgdGVzdGluZz8g
Ki8KPiA+ICAJYm9vbCBvdmVycmlkZV9lZGlkOwo+ID4gIAo+ID4gLSNkZWZpbmUgRFJNX0NPTk5F
Q1RPUl9NQVhfRU5DT0RFUiAzCj4gPiArI2RlZmluZSBEUk1fQ09OTkVDVE9SX01BWF9FTkNPREVS
IDMyCj4gPiAgCS8qKgo+ID4gIAkgKiBAZW5jb2Rlcl9pZHM6IFZhbGlkIGVuY29kZXJzIGZvciB0
aGlzIGNvbm5lY3Rvci4gUGxlYXNlIG9ubHkgdXNlCj4gPiAgCSAqIGRybV9jb25uZWN0b3JfZm9y
X2VhY2hfcG9zc2libGVfZW5jb2RlcigpIHRvIGVudW1lcmF0ZSB0aGVzZS4KPiAKPiBJIHdvbmRl
ciBpZiB3ZSBjb3VsZG4ndCBqdXN0IHJlcGxhY2UgdGhpcyBhcnJheSB3aXRoIGEgYml0bWFzaz8K
PiBJIHRoaW5rIHRoZSBmb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKCkgdGhpbmcgSSBkaWQgYSB3
aGlsZSBiYWNrCj4gc2hvdWxkIG1ha2UgdGhpcyBlYXNpZXIgcG90ZW50aWFsbHkgYmVjYXVzZSBt
b3N0IGRyaXZlciBjb2RlIGp1c3QKPiB1c2VzIHRoYXQuCgorMSBvbiBwb3NzaWJsZSBlbmNvZGVy
cyBiaXRtYXNrLiBNb3JlIGNvbnNpc3RlbnQgYXQgbGVhc3QuCi1EYW5pZWwKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
