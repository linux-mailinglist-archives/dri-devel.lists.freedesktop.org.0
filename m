Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D93640DD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2786E252;
	Mon, 19 Apr 2021 11:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD2A6E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618833001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OeTmn3FpbFUKffAvSBuF9L9RSoOACTtnRhAzQxRMNI=;
 b=ZlBbfp0klhF4Qd/5iwSm7PtEjR5KcN/fLfNZWhG2D0YZRgwKL8v+GvcxvKdZi6ouer7Gk+
 3RKnIca/2O748IEX8HabsQ3PBZQF561BVjREY52VQpOhW0aGS2mFdGlJ/BC1cv/GJjYHhx
 De8wd18PtUhDBIRjwPEBMCc93alb4Qw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-MG4Y2KRhMKG8-qsAlzLm3g-1; Mon, 19 Apr 2021 07:49:59 -0400
X-MC-Unique: MG4Y2KRhMKG8-qsAlzLm3g-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so4402454wrl.20
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4OeTmn3FpbFUKffAvSBuF9L9RSoOACTtnRhAzQxRMNI=;
 b=r9wQJ4vv4/uSLoBxOaN3PMdKSfjG+RQgagi9G/kQimClh+1F8Djlm2y0dpQMzRkoIL
 Pnm258Wes+Qhp7VS/b2rO4g22bejim5pnKtQ9nPaPyK7LCFoDP+jYFil18ppPRtmbWbt
 asztSWsn1vtVL2j1vF6uOjsA1GkXNlSAzR0rjorwAgqPN91iS9r7Pw+lMNPTktJ0oSdC
 NL8iyIX/v2aI8eKEwyDkRIKd/1NNRwGQloWjHE1f3X4CQb76is2eGRhfJ5ukpTX/SbEE
 trYaD2XvcVq0KgdUktTYSe8/tViPHxMD375pVxfToEuQWIDZwQFdWCG90wRPqPTmwgIe
 HDIw==
X-Gm-Message-State: AOAM532cwEhlpyhP5BGQdLRJ+/R+ROl6cb+7PU8VXBnGrMoTbzY8UyCr
 LvtYOhz5RwGwVJhgLR62CMCJ4MHqlK+yah7BDSL8stjwYIKx6f3vd9rtv6+GamxnJb3xeKqOjRu
 QBpF4Ds78NCX9OS7zUmQJVjjBn76v6P950DhUE2V4R7K4
X-Received: by 2002:adf:ec42:: with SMTP id w2mr14074908wrn.373.1618832998772; 
 Mon, 19 Apr 2021 04:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLwKcD0/QfFrXTpG9Ze8cVc8PUyBjsNLwD4wylL2K1NJkkTxya259K5+FXuzZ/wkYrN2Jsdk/SsSVasMPFFAs=
X-Received: by 2002:adf:ec42:: with SMTP id w2mr14074891wrn.373.1618832998608; 
 Mon, 19 Apr 2021 04:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-14-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-14-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:49:48 +0200
Message-ID: <CACO55tu6B5kQM3HKAeMFNQ7TF3vKzsgMVC0J18h+UNeJi-O36Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 13/40] drm/nouveau/dispnv50/disp: Include header
 containing our prototypes
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3
cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoyNTk5OjE6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbnY1MF9kaXNwbGF5X2NyZWF0ZeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+
IGluZGV4IDM1MWY5NTQ5ODk1MzAuLjQ5MDVlZDU4NGZmNDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gQEAgLTY4LDYgKzY4LDggQEAKPgo+ICAjaW5jbHVk
ZSA8c3ViZGV2L2Jpb3MvZHAuaD4KPgo+ICsjaW5jbHVkZSAibnY1MF9kaXNwbGF5LmgiCj4gKwo+
ICAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqCj4gICAqIEVWTyBjaGFubmVsCj4gICAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
