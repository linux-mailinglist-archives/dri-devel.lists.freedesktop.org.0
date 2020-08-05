Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9894223C53D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE85D6E4D2;
	Wed,  5 Aug 2020 05:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198FE6E4D2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:49:14 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id c18so15775569ybr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vOHljYi2PrGL252Ao6UoRsZQfRN5edT6EXPTS3Smw38=;
 b=PCiHD85fZLmT13wceXfrUO86X4MzkLAuA6/6nn09dJYi6YM8Y1cEKbs/6h731Z0uHm
 zTd4ijab4oblRVYbHHDBNC4LFUkVtLHJoGVOf7FlGP37pHR88iWyo+412VMo0Z5FdmDH
 4UJUrU4dPgDCCB1qfFiODps0NWOIsJDyj9TfQlsopu4Bf8FRzFJc5sB73I0SLmXIJ6Ei
 uQuNJMUDC8i4a+4xb4X9VQ1076Vrb+D9YJr0j4CmF/7OmwDsmbdg8ASGXsMTUvCQJngu
 iZ872P7wrR8FPovaufKwunak+NWTBUJsAXAcXYrzRIkOP5pcMBY28XyT+enKJbwXRA6q
 jRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vOHljYi2PrGL252Ao6UoRsZQfRN5edT6EXPTS3Smw38=;
 b=s1aGZJtHYNApPjoCakCFzSFzZUiBMwy0s+vaO/7unHGx2wQpr9e1hu5mSI/HQUghhU
 hdiaIRJh4mqRg2Y4f4yAMtUUXeweB7JmYjBJCnsg4zwv08MVG9KkYZEDynsNWlfTKtHb
 +DxZtLEOixUW3QITo1/3eKFJQqro3R5QRDLltFTJFzi79BX1Icm+FFjD9zNhuq0thFxU
 Il9IRbktUbvoAaEjcMoukeOvYrGSrVPQbFPTxC4KfdEDNNAcP2Wrp0bc0AK5PtKBWsvh
 thxqnk06qQ0ihwSzhANwq37ZkS7ULLeN0TwDiPjXo3gQtpr4dQ+XYHsca+D/EGR4F1x8
 rMbQ==
X-Gm-Message-State: AOAM533DYk+8wOkmRpDoSOIHwySUCQvww2K1XubB2+OZGwGtDiArg2nK
 k6JJIfzoXbYp0gwA19wRcHadoU8aLCFLYicssZI=
X-Google-Smtp-Source: ABdhPJwyK9TKzmGy4+YocGgDod4fqycS/KtCjpixLcn8KRYQwZWrNZxWgf2WVjTNYEzSfnuvutimlPpqATcrl+jIzVU=
X-Received: by 2002:a25:2e12:: with SMTP id u18mr2251639ybu.200.1596606553367; 
 Tue, 04 Aug 2020 22:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-44-airlied@gmail.com>
 <c15eb92c-19f8-f0bd-f0dd-965ef036a396@amd.com>
In-Reply-To: <c15eb92c-19f8-f0bd-f0dd-965ef036a396@amd.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:49:02 +1000
Message-ID: <CACAvsv5ig2DauqyZLKjK7zzydH+LFdb_zPhgJtFBbuR0QLezEg@mail.gmail.com>
Subject: Re: [PATCH 43/59] drm/ttm: rename manager variable to make sure
 wrapper is used.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Ben Skeggs <bskeggs@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDIxOjMwLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBE
YXZlIEFpcmxpZToKPiA+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
Pgo+ID4gT3RoZXIgdXNlcnMgb2YgdGhpcyBzaG91bGQgbm90aWNlIHRoaXMgY2hhbmdlIGFuZCBz
d2l0Y2ggdG8gd3JhcHBlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVk
aGF0LmNvbT4KCj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAg
IHwgMiArLQo+ID4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgNyArKysrKy0t
Cj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ID4gaW5kZXggODc3N2MzMjNlN2RlLi4zYTNhNGRmYjBm
ZmYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPiBAQCAtMTYxNyw3ICsxNjE3LDcgQEAg
aW50IHR0bV9ib19kZXZpY2VfaW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiA+Cj4g
PiAgICAgICBiZGV2LT5kcml2ZXIgPSBkcml2ZXI7Cj4gPgo+ID4gLSAgICAgbWVtc2V0KGJkZXYt
Pm1hbiwgMCwgc2l6ZW9mKGJkZXYtPm1hbikpOwo+ID4gKyAgICAgbWVtc2V0KGJkZXYtPm1hbl9w
cml2LCAwLCBzaXplb2YoYmRldi0+bWFuX3ByaXYpKTsKPiA+Cj4gPiAgICAgICB0dG1fYm9faW5p
dF9zeXNtYW4oYmRldik7Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gPiBpbmRleCBl
ODBkZWVlM2FlOTkuLjAzYjI1M2QxNGU2YSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmgKPiA+IEBAIC00MTUsNyArNDE1LDEwIEBAIHN0cnVjdCB0dG1fYm9fZGV2aWNlIHsKPiA+ICAg
ICAgICAqLwo+ID4gICAgICAgc3RydWN0IGxpc3RfaGVhZCBkZXZpY2VfbGlzdDsKPiA+ICAgICAg
IHN0cnVjdCB0dG1fYm9fZHJpdmVyICpkcml2ZXI7Cj4gPiAtICAgICBzdHJ1Y3QgdHRtX21lbV90
eXBlX21hbmFnZXIgbWFuW1RUTV9OVU1fTUVNX1RZUEVTXTsKPiA+ICsgICAgIC8qCj4gPiArICAg
ICAgKiBhY2Nlc3MgdmlhIHR0bV9tYW5hZ2VyX3R5cGUuCj4gPiArICAgICAgKi8KPiA+ICsgICAg
IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciBtYW5fcHJpdltUVE1fTlVNX01FTV9UWVBFU107
Cj4gPgo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIFByb3RlY3RlZCBieSBpbnRlcm5hbCBsb2Nr
cy4KPiA+IEBAIC00NDcsNyArNDUwLDcgQEAgc3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ID4gICBz
dGF0aWMgaW5saW5lIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqdHRtX21hbmFnZXJfdHlw
ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbWVtX3R5cGUpCj4gPiAgIHsK
PiA+IC0gICAgIHJldHVybiAmYmRldi0+bWFuW21lbV90eXBlXTsKPiA+ICsgICAgIHJldHVybiAm
YmRldi0+bWFuX3ByaXZbbWVtX3R5cGVdOwo+ID4gICB9Cj4gPgo+ID4gICAvKioKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
