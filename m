Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85A5739B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 23:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C199D8825B;
	Wed, 26 Jun 2019 21:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF418825B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 21:27:39 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so4988696edr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=UrjR3DDihkVtErCxXsK+ErOLFwWfcE9m/qcnzk09UyY=;
 b=K9CKMmqNmmdKJyH0rHQyQ7BAuwbCjW9EPm6aHbuZ2PK7T1hwoBee6dvj4XUGfYxZwt
 Gs66JfNhEsi936PbfpXlrpt8lJoFZICRTBcPlTg83bLXohk/tn03wnZTiCdugmV23iQC
 /6hy/+Bj5yrf/Wcg8LrDgkqhqVuVATavGid2yJ+hHdI/rh3/OIxAby6WHlG0GN5/e9jt
 znk0waB6/GCdDAWxQP6pLpVALLxyQucye9kXUpE73ZTCkOT+rMQRwbWcfd0dho4niXJb
 vEh/wxBE711l3D/yxKE9gHnYxHwI9XVCi6ggOw1CXaf8+tLbUuoHG33pNB5WPJsyhpcx
 nbSQ==
X-Gm-Message-State: APjAAAUB+scyw943cdlOvPlXYbIo0mV+7AgkuYgHX1Hp3xACNJleVzDT
 zbxT62P9HTbkjjmyNY/RzFwARw==
X-Google-Smtp-Source: APXvYqzR0IbAROk3gpDamYKJeT+OF9uZlY5ZEmOadbWZJftZuRBhsscuB56FYYJd7NYuf1+9vgy3TA==
X-Received: by 2002:a17:906:6d2:: with SMTP id
 v18mr6059151ejb.279.1561584458203; 
 Wed, 26 Jun 2019 14:27:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q50sm27042edd.91.2019.06.26.14.27.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 14:27:37 -0700 (PDT)
Date: Wed, 26 Jun 2019 23:27:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] drm: fix a reference for a renamed file: fb/modedb.rst
Message-ID: <20190626212735.GY12905@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <699d7618720e2808f9aa094a13ab2f3545c3c25c.1561565652.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <699d7618720e2808f9aa094a13ab2f3545c3c25c.1561565652.git.mchehab+samsung@kernel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=UrjR3DDihkVtErCxXsK+ErOLFwWfcE9m/qcnzk09UyY=;
 b=cgLAV+Rp6zbNz1nb64bmt0RkKhKMJQ9aqc+CMUU2XUHSBJQ6pHvdXE3dH36q6wAchh
 Wt67WeRnz1HwvYQNsaJhuip9yFw8HMEiia1oFayPRFAuERJEJUTYeRRQkWQID7etjTds
 LnUtOuywRKbB0Nr0sH+C5YmuQkPnrTfL6aExg=
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
Cc: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDE6MTQ6MTNQTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IER1ZSB0byB0d28gcGF0Y2hlcyBiZWluZyBhcHBsaWVkIGFib3V0IHRo
ZSBzYW1lIHRpbWUsIHRoZQo+IHJlZmVyZW5jZSBmb3IgbW9kZWRiLnJzdCBmaWxlIGdvdCB3cm9u
ZzoKPiAKPiAJRG9jdW1lbnRhdGlvbi9mYi9tb2RlZGIudHh0IGlzIG5vdyBEb2N1bWVudGF0aW9u
L2ZiL21vZGVkYi5yc3QuCj4gCj4gRml4ZXM6IDFiZjRlMDkyMjdjMyAoImRybS9tb2RlczogQWxs
b3cgdG8gc3BlY2lmeSByb3RhdGlvbiBhbmQgcmVmbGVjdGlvbiBvbiB0aGUgY29tbWFuZGxpbmUi
KQo+IEZpeGVzOiBhYjQyYjgxODk1NGMgKCJkb2NzOiBmYjogY29udmVydCBkb2NzIHRvIFJlU1Qg
YW5kIHJlbmFtZSB0byAqLnJzdCIpCj4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hl
aGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KCldoYXQncyB0aGUgbWVyZ2UgcGxhbiBo
ZXJlPyBkb2MtbmV4dD8gSWYgc286CgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2Rlcy5jCj4gaW5kZXggNTdlNjQwODI4OGM4Li40NjQ1YWY2ODFlZjggMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2Rlcy5jCj4gQEAgLTE2ODAsNyArMTY4MCw3IEBAIHN0YXRpYyBpbnQgZHJtX21vZGVf
cGFyc2VfY21kbGluZV9vcHRpb25zKGNoYXIgKnN0ciwgc2l6ZV90IGxlbiwKPiAgICoKPiAgICog
QWRkaXRpb25hbHMgb3B0aW9ucyBjYW4gYmUgcHJvdmlkZWQgZm9sbG93aW5nIHRoZSBtb2RlLCB1
c2luZyBhIGNvbW1hIHRvCj4gICAqIHNlcGFyYXRlIGVhY2ggb3B0aW9uLiBWYWxpZCBvcHRpb25z
IGNhbiBiZSBmb3VuZCBpbgo+IC0gKiBEb2N1bWVudGF0aW9uL2ZiL21vZGVkYi50eHQuCj4gKyAq
IERvY3VtZW50YXRpb24vZmIvbW9kZWRiLnJzdC4KPiAgICoKPiAgICogVGhlIGludGVybWVkaWF0
ZSBkcm1fY21kbGluZV9tb2RlIHN0cnVjdHVyZSBpcyByZXF1aXJlZCB0byBzdG9yZSBhZGRpdGlv
bmFsCj4gICAqIG9wdGlvbnMgZnJvbSB0aGUgY29tbWFuZCBsaW5lIG1vZGxpbmUgbGlrZSB0aGUg
Zm9yY2UtZW5hYmxlL2Rpc2FibGUgZmxhZy4KPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
