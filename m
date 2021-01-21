Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4132FE4F3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC46E51C;
	Thu, 21 Jan 2021 08:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC866E51C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:27:59 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id r199so305594oor.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 00:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3DWfhAf0O5VKGxPrvVIq7P4df0BxBVjRhTibdhksyv0=;
 b=BxfB7cGgvfaXW68wVNsC2xzlRISsBn2rxD9Mpl8s3L9rjPFpB/PvjwqoOaPoqVQufT
 GhHvU5u9dms0u6zSWGTfbwGNiHZV9dBIIKxYsVM5P/ImmTnSSBul0eXqEhWI/EN3fLNe
 f3wA1OafrKMaLvc+P5tX6VWYn0FploK4OE2pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3DWfhAf0O5VKGxPrvVIq7P4df0BxBVjRhTibdhksyv0=;
 b=DKdsKXXr54WJ5C9vJUJPpXYZ4hhFGoATEEhaBQLvuESAIT/flMj047TCST1Km2ct2J
 2OYOHGR0o8oSke79oJPOlIHp4I5ywmjsweF7sgY/Vrf/UQgK59g1zMk5cmTmWr8lzLxm
 QmiwhFpKFk4fPKQKm6mw//ceyby4PmkjAQ6IlbU+M0WVL2s/YjFCEZlUERsZkoPKhHMk
 omY/fmFJcZ78J/bBz3YkDfe0f2V4Bpu1YVxfDBPRCmiglhij2dv7IRgkHDvOrcDqhdWL
 zCWoXCdSNar4jKAbl3T6sLWJxVDJ3CwTicPLaD5aPKDyGUnJQ1KpC1C3PaOakCpwHEvo
 G6xw==
X-Gm-Message-State: AOAM531R7KYdjfgF9kTk0MzAREHOfAicGjZfMPdXv6pXHuqyLFGlJOvi
 rBvPn7fIezCbC74pfjJ0gbhzjoO1fZNeUz6UWL2sNg==
X-Google-Smtp-Source: ABdhPJzRbplKL10b0xnxB5cq9dstRsRdcUVICyER8i9a2nkskBu3A5lHV3gTRql3FRfQZTiM9WKyN7zDATdcL1n6ETg=
X-Received: by 2002:a4a:9722:: with SMTP id u31mr8673370ooi.28.1611217679254; 
 Thu, 21 Jan 2021 00:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
In-Reply-To: <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 09:27:48 +0100
Message-ID: <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tyler Hardin <th020394@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgODo0NSBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaSBOb3JhbGYsCj4KPiBnbGFkIHRvIGhlYXIgZnJv
bSB5b3UhIFdlbGNvbWUgYmFjayEKPgo+IEFtIDIwLjAxLjIxIHVtIDE4OjQyIHNjaHJpZWIgRGFu
aWVsIFZldHRlcjoKPiA+IE9uIFdlZCwgSmFuIDIwLCAyMDIxIGF0IDY6MTAgUE0gTm9yYWxmIFRy
w7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gQWRkIGEgY29ubmVj
dG9yIHR5cGUgZm9yIFVTQiBjb25uZWN0ZWQgZGlzcGxheSBwYW5lbHMuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+PiAtLS0K
PiA+PiAgIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCB8IDEgKwo+ID4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2RybS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4gPj4gaW5kZXgg
ZmVkNjZhMDNjN2FlLi4zMzAyNGNjNWQyNmUgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS91YXBp
L2RybS9kcm1fbW9kZS5oCj4gPj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4g
Pj4gQEAgLTM2Nyw2ICszNjcsNyBAQCBlbnVtIGRybV9tb2RlX3N1YmNvbm5lY3RvciB7Cj4gPj4g
ICAjZGVmaW5lIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkgICAgICAgICAxNwo+ID4+ICAgI2RlZmlu
ZSBEUk1fTU9ERV9DT05ORUNUT1JfV1JJVEVCQUNLICAgMTgKPiA+PiAgICNkZWZpbmUgRFJNX01P
REVfQ09OTkVDVE9SX1NQSSAgICAgICAgIDE5Cj4gPj4gKyNkZWZpbmUgRFJNX01PREVfQ09OTkVD
VE9SX1VTQiAgICAgICAgIDIwCj4KPiBJIHdvdWxkIG5vdCBjYWxsIGl0IFVTQi4gSSBjb3VsZCBp
bWFnaW5lIHRoYXQgYXQgc29tZSBwb2ludCBhIGdlbmVyaWMKPiBVU0IgcHJvdG9jb2wgY291bGQg
c2VydmUgc2ltcGxlIGRpc3BsYXlzIChpLmUuIGluIHRoZSBzZW5zZSBvZiBVU0IgSElECj4gb3Ig
ZGF0YSBvciBpbWFnaW5nKS4gKE1heWJlIFRodW5kZXJib2xkIGFscmVhZHkgY291bnRzLikgQW55
d2F5LCBVU0IKPiBzaG91bGQgYmUgcmVzZXJ2ZWQgZm9yIHRoaXMgY2FzZS4KCldlIGVuZCB1cCBj
YWxsaW5nIHRob3NlIERpc3BsYXlQb3J0LCBzaW5jZSB0aGF0J3Mgd2hhdCdzIGJlaW5nCnRyYW5z
cG9ydGVkIG92ZXIgdGh1bmRlcmJvbHQgb3IgdXNiLUMuIFNvIHRoZSB1c2IgY29ubmVjdG9yIHdv
dWxkIGJlCmNhbGxlZCB1c2ItQy4gSSB0aGluayB0aGUgcmVhc29uIHdlIGRvbid0IGRvIGZhbmN5
IGNvbm5lY3RvciBuYW1lcyBpcwp0aGF0IGFkZGluZyB0aGVtIGlzIGEgYml0IGEgcGFpbi4gUGx1
cyBkcm0vaTkxNSBzcGVjaWZpY2FsbHkgaGFzIHNvbWUKdmVyeSBxdWlya3kgY29ubmVjdG9yIGVu
dW1lcmF0aW5nIHRoYXQgZG9lc24ndCBtYXRjaCBtdWNoIHdpdGggcmVhbGl0eQp1bmZvcnR1bmF0
ZWx5IGFueXdheSA6LS8KLURhbmllbAoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4gPgo+
ID4gQmV3YXJlLCBuZXcgY29ubmVjdG9yIHR5cGVzIGhhdmUgaW4gdGhlIHBhc3QgcmVzdWx0ZWQg
aW4gdXNlcnNwYWNlCj4gPiBidXJuaW5nJmNyYXNoaW5nLiBNYXliZSBpdCdzIGJlY29tZSBiZXR0
ZXIgLi4uCj4gPgo+ID4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Cj4gPj4KPiA+PiAgIC8qKgo+ID4+ICAgICogc3RydWN0IGRybV9tb2RlX2dldF9jb25u
ZWN0b3IgLSBHZXQgY29ubmVjdG9yIG1ldGFkYXRhLgo+ID4+IC0tCj4gPj4gMi4yMy4wCj4gPj4K
PiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPiA+Cj4gPgo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
Cj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPgoK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
