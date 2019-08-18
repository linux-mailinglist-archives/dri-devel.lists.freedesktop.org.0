Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33069164A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 12:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AFD6E067;
	Sun, 18 Aug 2019 10:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979726E067
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 10:56:10 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EECECC08E2A3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 10:56:09 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id h25so376788edb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 03:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N1oFPREonVFCSXkel1YDD5StM3EQdi/NrsCIL6ptuWc=;
 b=GD2m3H+UoKn5l7gq63TBjscc91EKVQPKag2ykSML9HimTaji+bATCC4sMqokV3cgLN
 G0UZQoD+gr1Op0Dp6llEL9NyLDJAd3ZOKkH0biNW/5e9Xfan5w9VrwOMruD5VUiSz/eZ
 yZsiQa4d4EO+Fy8ofJ+mWLqEcTW7XCzmtWiILG1xRkCZ5atPPCix89nSgidWZl5Wn/9z
 usMyhyjhj6tLv/JpxFmha350kWWCdqnSNEc9NYSIi7hXqLVlV08IffB1hMFCxWVXagYU
 58wWBZG0uNKmJ1VtktaT37lK+0fQqJXTLc+WbcYT/m5+ve57qCu7wDylukqJqoS6Wh5f
 dOkA==
X-Gm-Message-State: APjAAAXCZXjJuG1X0a++c3jcsGS71CKxx8lzWwk9HJVCHcEcOTKOlDQB
 sr9c06OJkrDF+WYoUGPgks6K33BDWRIlfQgplT6ZjEqyGTXzAhyLf7dsLZlpdrZ142CH8mdCG07
 m9Gc7S2xG9GCVv5YdidKf8Zss1u+h
X-Received: by 2002:a17:906:578a:: with SMTP id
 k10mr16584603ejq.235.1566125768281; 
 Sun, 18 Aug 2019 03:56:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuIfTQWpTeAZRv/pfumXrRYXSRSIPvXk7lEdR3GinwGNW4wD04rFPEuYbKXnLFEF3QWPxlPA==
X-Received: by 2002:a17:906:578a:: with SMTP id
 k10mr16584598ejq.235.1566125768111; 
 Sun, 18 Aug 2019 03:56:08 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id um15sm1593343ejb.27.2019.08.18.03.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2019 03:56:07 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
 <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
 <20190814172634.GP7444@phenom.ffwll.local>
 <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
Message-ID: <9c0d68a6-e385-9add-e91c-53871826f053@redhat.com>
Date: Sun, 18 Aug 2019 12:56:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
Content-Language: en-US
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKT24gMTQtMDgtMTkgMTk6MzYsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gSGksCj4g
Cj4gT24gMTQtMDgtMTkgMTk6MjYsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFR1ZSwgQXVn
IDEzLCAyMDE5IGF0IDA5OjU3OjE5QU0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+PiBI
aSwKPj4+Cj4+PiBPbiAxMy0wOC0xOSAwODoyNSwgTmlzaGthIERhc2d1cHRhIHdyb3RlOgo+Pj4+
IFRoZSBzdGF0aWMgc3RydWN0dXJlIHZib3hfZmJfaGVscGVyX2Z1bmNzLCBvZiB0eXBlIGRybV9m
Yl9oZWxwZXJfZnVuY3MsCj4+Pj4gaXMgdXNlZCBvbmx5IHdoZW4gaXQgaXMgcGFzc2VkIGFzIHRo
ZSB0aGlyZCBhcmd1bWVudCB0bwo+Pj4+IGRybV9mYl9oZWxwZXJfZmJkZXZfc2V0dXAoKSwgd2hp
Y2ggZG9lcyBub3QgbW9kaWZ5IGl0LiBIZW5jZSBtYWtlIGl0Cj4+Pj4gY29uc3RhbnQgdG8gcHJv
dGVjdCBpdCBmcm9tIHVuaW50ZW5kZWQgbW9kaWZpY2F0aW9ucy4KPj4+PiBJc3N1ZSBmb3VuZCB3
aXRoIENvY2NpbmVsbGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEg
PG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPj4+Cj4+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aCwgdGhpcyBsb29rcyBnb29kIHRvIG1lOgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+Pgo+PiBJJ20gYXNzdW1pbmcgeW91J2xsIGFwcGx5
IHRoaXMgdG8gZHJtLW1pc2MtbmV4dCB0b28/IEdvb2QgdG8gc3RhdGUgdGhhdCwKPj4gdG8gYXZv
aWQgY29uZnVzaW9uIGFuZCBjb29yZGluYXRpb24gaXNzdWVzLgo+IAo+IEFjdHVhbGx5IEknbSBz
byB1c2VkIHRvIHRoZSB3b3JrZmxvdyBpbiBvdGhlciBzdWJzeXN0ZW1zIEkgd2FzCj4gZXhwZWN0
aW5nIHRoZSBzdWJzeXMgbWFpbnRhaW5lciB0byBwaWNrIGl0IHVwLiBCdXQgSSBrbm93IHRoYXQK
PiBpcyBub3QgaG93IGl0IHdvcmtzIGZvciB0aGUgZHJtIHN1YnN5cyBhbmQgc2luY2UgSSdtIHRo
ZSB2Ym94dmlkZW8KPiBtYWludGFpbmVyIEkgZ3Vlc3MgaXQgbWFrZXMgc2Vuc2UgZm9yIG1lIHRv
IHBpY2sgdGhpcyB1cCBhbmQgcHVzaCBpdC4KPiAKPiBTbyB5ZXMgSSB3aWxsIHBpY2sgdGhpcyB1
cCBhbmQgcHVzaCBpdCB0byBkcm0tbWlzYy1uZXh0LCBzb3JyeQo+IGZvciB0aGUgY29uZnVzaW9u
LgoKSSd2ZSBwdXNoZWQgdGhpcyB0byBkcm0tbWlzYy1uZXh0IG5vdy4KClJlZ2FyZHMsCgpIYW5z
CgoKCj4+Pj4gLS0tCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2
LmMgfCAyICstCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVv
L3Zib3hfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPj4+PiBp
bmRleCAwMjUzN2FiOWNjMDguLjJiNTdlYTMxOTVmMiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmJveHZpZGVvL3Zib3hfZHJ2LmMKPj4+PiBAQCAtMzIsNyArMzIsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7Cj4+Pj4gwqDCoCB9Owo+Pj4+IMKg
wqAgTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIHBjaWlkbGlzdCk7Cj4+Pj4gLXN0YXRpYyBzdHJ1
Y3QgZHJtX2ZiX2hlbHBlcl9mdW5jcyB2Ym94X2ZiX2hlbHBlcl9mdW5jcyA9IHsKPj4+PiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZmJfaGVscGVyX2Z1bmNzIHZib3hfZmJfaGVscGVyX2Z1bmNz
ID0gewo+Pj4+IMKgwqDCoMKgwqDCoCAuZmJfcHJvYmUgPSB2Ym94ZmJfY3JlYXRlLAo+Pj4+IMKg
wqAgfTsKPj4+Pgo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
