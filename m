Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BC4F55F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 12:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1999D6E969;
	Sat, 22 Jun 2019 10:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE386E969
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 10:50:28 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id a127so6450653oii.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 03:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hAP+cHMr0/N+Z95wjLt2NLL3NCfKTeUVY7Ten7psDUs=;
 b=XMbZqLTZV5E7+ISsqAZeT6Dq1oPRkYl+gmW8f5t8DGyZMPQpewXsA6nlLgkpnFp7A0
 IJqCMBm1Utfghazr/9V0AIz9XOlCLtheGsw3nCXV4VsI5bNihdmtUgidJERNuvC2eGQ1
 zLdqR1ZDR79OiGErkmx3tXV8dSJ+1lNH+a989rDytAkero7CnIzJKFLT8yJnrUFpj4OF
 Tl2vu3PKJv5bYXYDsdwRl1bGWFW1dMdJIsiOTOEcmxdNRIkYOb7hWyn+ZsYOQ0HcoIhS
 3kykSmy0kwm5h5KnAj0S937woEo0SeeYN/QYm01JUmFsFsMt84CTe7Ep4vQZta5XKNTi
 blDA==
X-Gm-Message-State: APjAAAUa5KsxSR9fciHcDHc+ZxXh2AgWULbvL27o2tHV64mJnZfLSF1w
 ttRA8VyvCoBgY55GB+WsjAylErbk55o9II4+ACbWADXg
X-Google-Smtp-Source: APXvYqyzUq6eZb6JovcOmS3cnCQGCqHsR4qOHk+/GZGj8juiGIWuIXpCt3TAD3U1AwrDC6NIdUjOFaY3jmI4PwWtPUY=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr5709633oiy.110.1561200628075; 
 Sat, 22 Jun 2019 03:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
 <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
 <CLDOTegW4ppx_UNVBkWEPwtQRm_FyMR8CfTXADZYMh6A11C7wZuK4OdCpelWTVtJtxOH3VkLkXqtd7E4LqBPqpKB_7rYH8wq0xpKpmYUkZY=@emersion.fr>
In-Reply-To: <CLDOTegW4ppx_UNVBkWEPwtQRm_FyMR8CfTXADZYMh6A11C7wZuK4OdCpelWTVtJtxOH3VkLkXqtd7E4LqBPqpKB_7rYH8wq0xpKpmYUkZY=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 22 Jun 2019 12:50:16 +0200
Message-ID: <CAKMK7uEt30_y7kdFyF6x4PTNRGqceRhFX1cDOKtwj4WP3pYapQ@mail.gmail.com>
Subject: Re: KMS documentation for userspace
To: Simon Ser <contact@emersion.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hAP+cHMr0/N+Z95wjLt2NLL3NCfKTeUVY7Ten7psDUs=;
 b=FnGoBu7VWVEQX06xb9w+ArQ36IYOp50O493P5B2ZBcGKiV3EdK0ssDMCYG5ydV1F3H
 bgTrNW9VtDIVT+Pjv0T8zpQmindYCGmLxFVWeCTZzEp5eVncs1wAaB4GrSFhQ0rTBHVJ
 kPWv5RV9NKrYJz+3POpRKuGf+CYVOjDtPV95Y=
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMTE6NDIgQU0gU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPiB3cm90ZToKPiBPbiBXZWRuZXNkYXksIEp1bmUgMTksIDIwMTkgMTA6NTMgUE0sIERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiB0bGRyOyBZZXMsIEkganVz
dCBkaWRuJ3QgZ2V0IGFyb3VuZCB0byBpdCB5ZXQuCj4gPgo+ID4gVGhlIHJvdWdoIHBsYW4gaXMg
dG8gYWN0dWFsbHkgZG9jdW1lbnQgaW9jdGxzIGFuZCBwcm9wZXJ0aWVzIGFuZCBhbGwKPiA+IHRo
YXQgc3R1ZmYgaW4gZHJtLXVhcGkucnN0LCBhbmQgdGhlbiBjcm9zcy1saW5rIHRoYXQgd2l0aCB0
aGUKPiA+IGRyaXZlci1zaWRlIGRvY3VtZW50YXRpb24uCj4KPiBJJ20gY29uZnVzZWQgcmVnYXJk
aW5nIGRybS11YXBpLnJzdCdzIHJvbGUuIElzIGl0IGEgZG9jdW1lbnQgZm9yIGtlcm5lbCBkcml2
ZXIKPiB3cml0ZXJzIHRvIGV4cGFuZCB0aGUgdUFQSSwgb3IgaXMgaXQgYSBkb2N1bWVudCBmb3Ig
dXNlcnNwYWNlPwo+Cj4gSXQncyBjdXJyZW50bHkgZmlsbGVkIHdpdGggcmVmZXJlbmNlcyB0byBp
bnRlcm5hbCBrZXJuZWwgc3ltYm9scwo+IChkcm1fbWFzdGVyX2dldCwgZHJtX2lvY3RsX2Rlc2Ms
IGRybV9pb2N0bF9wZXJtaXQgYW5kIHNvIG9uKS4gU29tZSBjaGFwdGVycyBzZWVtCj4gZGVkaWNh
dGVkIHRvIGtlcm5lbCBkZXZzIChlLmcuICJUZXN0aW5nIGFuZCB2YWxpZGF0aW9uIikuCj4KPiBJ
cyBpdCByZWFsbHkgdGhlIHJpZ2h0IHBsYWNlIGZvciB1c2Vyc3BhY2UgZGV2cyB0byBsZWFybiBo
b3cgdG8gdXNlIEtNUz8KClRoZXJlJ3MgbW9yZSB0byBkcm0gdGhhbiBrbXMsIGJ1dCB5ZWFoIEkg
dGhpbmsgY3VycmVudGx5IHRoYXQncyB0aGUKYmVzdCBzdGFydGluZyBwb2ludCB3ZSBoYXZlIGZv
ciBkb2N1bWVudGluZyB0aGUgdWFwaS4gV2UgbWlnaHQgYWxzbwpuZWVkIHRvIHNlcGFyYXRlIHNv
bWUgb2YgdGhlIG1vcmUga2VybmVsLWludGVybmFsIGJpdHMgaW50byBvdGhlcgpjaGFwdGVycywg
ZS5nLiBpb2N0bCBhbmQgbWFzdGVyIHN0dWZmIGlzIGN1cnJlbnRseSB0aGVyZSBiZWNhdXNlIHRo
b3NlCmFyZSBmYWlybHkgaW1wb3J0YW50IGNvbmNlcHQgZnJvbSBhIGRybSB1YXBpIHBvdi4gQnV0
IG1heWJlIHdlIHNob3VsZApwdWxsIG91dCB0aGUgaW1wbGVtZW50YXRpb24gZGV0YWlscyBpbnRv
IHNvbWUgb3RoZXIgcGxhY2UuCgpHaXZlbiB0aGF0IDAgb2Ygb3VyIGlvY3RscyBhbmQgaW9jdGwg
c3RydWN0dXJlcyBhcmUgY3VycmVudGx5CmRvY3VtZW50ZWQsIEknbSBub3QgcmVhbGx5IHdvcnJp
ZWQgYWJvdXQgdGhvc2UgaXNzdWVzIGp1c3QgeWV0IDotKQotRGFuaWVsCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
