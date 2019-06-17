Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E38488EA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 18:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF2C89272;
	Mon, 17 Jun 2019 16:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A161889272
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 16:29:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so16999162edr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 09:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=HIMr7DBxV+lVb1ad/1erLYN+yXav2+IawerFUY+SLOM=;
 b=tn21svylP6r26Jl3GuA4MWZFHGk/h8UpWn9IGiyKjEPEn/WW4VfhDQQjiMlnH8I5iu
 ADu2uuJtNy9yPFI9tATXk2SfKrHKLJy57uHZ9Q89V8UTVqP4AeOE6gFhWeb6aDHa79ZQ
 SLw0IsiO/Z4OWP4q5VzJIY/0KZppPkxCfcbaF0Z2mvdaVKWkQLjDWRw9gTB9imtE988B
 UaP2uH2QN2jdsIA8vo0jFrv2ma/9TPItW+BwWXKK7JGYS+QkAtaOxSOrETWO3n1lrQb4
 6guei7tlU/3ax6r347/vjvplO9pIYqnKD1tV7JtrdriHcUdAT93T+VNEDBkeYC3D/JxM
 Fadw==
X-Gm-Message-State: APjAAAXOa0gBr/Noc2tTRmmTuBfYLlXSLnHMKF0NN4afM2oNec9D3UjL
 8f3lr/1OgIzd9lsAYd7hDAWJ5w==
X-Google-Smtp-Source: APXvYqzarYdbC3DtfJdknSEy1lYtRJzXvyt+PGfpme6Ik7JysJ/oQVlAIPYp5jEPZbJ9OMv5y/gyGQ==
X-Received: by 2002:a17:906:4f87:: with SMTP id
 o7mr94722148eju.281.1560788994268; 
 Mon, 17 Jun 2019 09:29:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i3sm3958295edk.9.2019.06.17.09.29.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 09:29:53 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:29:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
Message-ID: <20190617162951.GJ12905@phenom.ffwll.local>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-2-daniel.vetter@ffwll.ch>
 <f326e4e2-2cc3-6e90-f9d3-96b5c8c8b070@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f326e4e2-2cc3-6e90-f9d3-96b5c8c8b070@tronnes.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=HIMr7DBxV+lVb1ad/1erLYN+yXav2+IawerFUY+SLOM=;
 b=OL2EahftssJlI2W51JEBl+3KVei4JVafSFABH+Sf2EkrqVWsfAGa2mxKUcFl1Z83/s
 +CdnjfM6/1d6hGbsa88YowN7O+O/6OrBq3jVS6fJel+xFfhUukxqxM/twkNJ5a5NvBLg
 fiXkrIO0Vh8i4CogbFrv2ZxjuscZePKwi1pBE=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6NDc6NTBQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IAo+IAo+IERlbiAxNC4wNi4yMDE5IDIyLjM1LCBza3JldiBEYW5pZWwgVmV0dGVy
Ogo+ID4gV2UncmUga2luZGEgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4gU3BvdHRlZCB3
aGlsZSB0eXBpbmcgYmV0dGVyCj4gPiBnZW0vcHJpbWUgZG9jcy4KPiA+IAo+ID4gQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gQ2M6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgo+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gPiBDYzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IC0tLQo+
ID4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ID4gaW5kZXggYjRhNzZj
MjcwM2U1Li4yMzU4M2YwZTM3NTUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90
b2RvLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+IEBAIC0yMjgs
NiArMjI4LDEwIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcwo+ID4gIEdFTSBvYmplY3Rz
IGNhbiBub3cgaGF2ZSBhIGZ1bmN0aW9uIHRhYmxlIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBjYWxs
YmFja3Mgb24gdGhlCj4gPiAgRFJNIGRyaXZlciBzdHJ1Y3QuIFRoaXMgaXMgbm93IHRoZSBwcmVm
ZXJyZWQgd2F5IGFuZCBkcml2ZXJzIGNhbiBiZSBtb3ZlZCBvdmVyLgo+ID4gIAo+ID4gK1VuZm9y
dHVuYXRlbHkgc29tZSBvZiB0aGUgcmVjZW50bHkgYWRkZWQgR0VNIGhlbHBlcnMgYXJlIGdvaW5n
IGluIHRoZSB3cm9uZwo+ID4gK2RpcmVjdGlvbiBieSBhZGRpbmcgT1BTIG1hY3JvcyB0aGF0IHVz
ZSB0aGUgb2xkLCBkZXByZWNhdGVkIGhvb2tzLiBTZWUKPiA+ICtEUk1fR0VNX0NNQV9WTUFQX0RS
SVZFUl9PUFMsIERSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywgYW5kIERSTV9HRU1fVlJBTV9EUklW
RVJfUFJJTUUuCj4gPiArCj4gCj4gQm90aCBEUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMgYW5k
IERSTV9HRU1fU0hNRU1fRFJJVkVSX09QUyB1c2UgdGhlCj4gR0VNIHZ0YWJsZS4gT3IgYW0gSSBt
aXNzaW5nIHNvbWV0aGluZyBoZXJlPwoKZ2VtIHZ0YWJsZSBJIG1lYW4gZHJtX2dlbV9vYmplY3Rf
ZnVuY3MuIFdoaWNoIHRoZXNlIG1hY3JvcyBkZWZpbml0ZWx5CmFyZW4ndCB1c2VmdWwgZm9yLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
