Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38D2F7E96
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 15:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490B96E450;
	Fri, 15 Jan 2021 14:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E376E44B;
 Fri, 15 Jan 2021 14:51:13 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n186so1887902oia.5;
 Fri, 15 Jan 2021 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y2gm270jJ4fGeFDHYGPDAXebuqjuFYEvjiQVda/6GCg=;
 b=Gq36vMLKgcScX9q7ZNK+QUZTJGsS9ihKQNGxL+RWS/TeoDne9QJMWwpP88tmvFWxEI
 u7GF7wOUCbZ6sdPHfd02hGY/b3ixAmYd8FYbgd26QyKYdIE/t4R5jFzAXwE97FVy+4Az
 gYGrY6vqjwKaFhJAYvItGmTvDgqwDh8DT3VtK8KjnTzOGwTG2CTI1Oz7ZYwPIG4ZEl+l
 rgm9Tw+tn19X09DXDf4L8Eb4Eziwa+PAHoSGiPGs6XnnN8XrR6jk9KdLhLwiSfcE/hRl
 0VU/lk1vgBEAAeX6wV8zjkJu3ZPNU44208wMtKdwT7gjVeOuufypTe4hBZ1Q6iRLVslB
 lVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y2gm270jJ4fGeFDHYGPDAXebuqjuFYEvjiQVda/6GCg=;
 b=rgfDtAHpUxvmNFCAzuGPk/Qi4jq+TgFXi07EoUZKjJWh24TPBz5ii2RABksKaQ15/B
 lZ1EZX/TSIrngRE+pgfmbJnbzph5uazUxOk1ed427eVXFDm2LINQENEZHdHgAy6iNnPE
 NmFgtFePCxm9Scagoh1B3ikuPAzW5LKZCO6v41+IiTPU0fQFf16nrVWpP34QVWS9rV7T
 FIrkwV2e6XEGLaPJzS5fdDitGXblL5H4s/W9Vq0UAEJjP6T0Qwxjdb4aO5SMOHYSKJRs
 p/wkwdWoJdjaNtk4oMfjQIidxd/dGtMQGdszvJ1MlDxN6UBdg+f23yTUZauKmfKxW5c6
 U7bw==
X-Gm-Message-State: AOAM530FUjCfPngidvvReX2DueAMok1ZxeWGZK0iZ6uwzN4GcnqgW4Cs
 cowmSF3YMYrKIBlsT/eCc/aST76fyoXVNp+Dpz8=
X-Google-Smtp-Source: ABdhPJzchTshup902GEUYWdrVqTlHuK/ZgqTWoLDcSBewYVLZIWg4P3vdKaqldv97NXOqVLNbYr5JijGGYtCLlSpdn8=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr5792331oib.123.1610722272805; 
 Fri, 15 Jan 2021 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20210114212148.23714-1-alexander.deucher@amd.com>
 <CAPM=9tyS_JyY3=ZSmrmmgfK=Cm1NRcMjpgA3Jj=BZXPH=Ady0w@mail.gmail.com>
In-Reply-To: <CAPM=9tyS_JyY3=ZSmrmmgfK=Cm1NRcMjpgA3Jj=BZXPH=Ady0w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 15 Jan 2021 09:51:01 -0500
Message-ID: <CADnq5_N5ZwypdZtY8Dp-p+H-ew-X5=dBTgc3p6duBH6=fXTU6g@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-next-5.12
To: Dave Airlie <airlied@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMTUsIDIwMjEgYXQgMjoyOCBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAxNSBKYW4gMjAyMSBhdCAwNzoyMiwgQWxleCBEZXVj
aGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIERhdmUsIERhbmll
bCwKPiA+Cj4gPiBNb3JlIG5ldyBzdHVmZiBmb3IgNS4xMi4KPiA+Cj4gPiBUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDA0NGE0OGY0MjBiOWQzYzE5YTEzNWI4MjFjMzRkZTViMmJl
ZTQwNzU6Cj4gPgo+ID4gICBkcm0vYW1kZ3B1OiBmaXggRFJNX0lORk8gZmxvb2QgaWYgZGlzcGxh
eSBjb3JlIGlzIG5vdCBzdXBwb3J0ZWQgKGJ1ZyAyMTA5MjEpICgyMDIxLTAxLTA4IDE1OjE4OjU3
IC0wNTAwKQo+ID4KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+
ID4KPiA+ICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4LmdpdCB0
YWdzL2FtZC1kcm0tbmV4dC01LjEyLTIwMjEtMDEtMTQKPiA+Cj4gPiBmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gZGYxZjA1NjBkMjhmNDg5NWUyZDYxYWY4MjY3MjhlZmI2MTk3NmY5ZjoK
PiA+Cj4gPiAgIGRybS9hbWQvZGlzcGxheTogU2ltcGxpZnkgYm9vbCBjb21wYXJpc29uICgyMDIx
LTAxLTE0IDEzOjIwOjIxIC0wNTAwKQo+Cj4gYXJtIDMyLzY0IGJ1aWxkcyBzYXkgbm8uCj4KPiAg
IENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9nazIw
YS5vCj4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jOgo+IEluIGZ1bmN0aW9u
IOKAmHZhbmdvZ2hfZ2V0X3NtdV9tZXRyaWNzX2RhdGHigJk6Cj4gL2hvbWUvYWlybGllZC9kZXZl
bC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9z
bXUxMS92YW5nb2doX3BwdC5jOjMwMDoxMDoKPiBlcnJvcjog4oCYYm9vdF9jcHVfZGF0YeKAmSB1
bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZAo+IHlvdSBtZWFuIOKA
mGJsX2dldF9kYXRh4oCZPwo+ICAgICAgICAgICBib290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMg
KiBzaXplb2YodWludDE2X3QpKTsKPiAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+ICAgICAgICAg
ICBibF9nZXRfZGF0YQo+IC9ob21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzozMDA6
MTA6Cj4gbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBv
bmNlIGZvciBlYWNoCj4gZnVuY3Rpb24gaXQgYXBwZWFycyBpbgo+IC9ob21lL2FpcmxpZWQvZGV2
ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUv
c211MTEvdmFuZ29naF9wcHQuYzoKPiBJbiBmdW5jdGlvbiDigJh2YW5nb2doX3JlYWRfc2Vuc29y
4oCZOgo+IC9ob21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzoxMzIwOjExOgo+IGVy
cm9yOiDigJhib290X2NwdV9kYXRh4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKTsgZGlkCj4geW91IG1lYW4g4oCYYmxfZ2V0X2RhdGHigJk/Cj4gICAgKnNpemUgPSBi
b290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMgKiBzaXplb2YodWludDE2X3QpOwo+ICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fgo+ICAgICAgICAgICAgYmxfZ2V0X2RhdGEKPiAvaG9tZS9haXJsaWVk
L2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3
c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6Cj4gSW4gZnVuY3Rpb24g4oCYdmFuZ29naF9vZF9lZGl0
X2RwbV90YWJsZeKAmToKPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6MTQ2
MDoxOToKPiBlcnJvcjog4oCYYm9vdF9jcHVfZGF0YeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbik7IGRpZAo+IHlvdSBtZWFuIOKAmGJsX2dldF9kYXRh4oCZPwo+ICAg
IGlmIChpbnB1dFswXSA+PSBib290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMpIHsKPiAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+ICAgICAgICAgICAgICAgICAgICBibF9nZXRfZGF0
YQo+IG1ha2VbNV06ICoqKiBbL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9zY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkOjI3OToKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
bS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5vXSBFcnJvciAxCj4KPgo+IE5vdCBzdXJlIHVzaW5n
IGJvb3RfY3B1X2RhdGEgaW4gYSBkcml2ZXIgaXMgdGhhdCBnb29kIGFuIGlkZWEsIG1heWJlCj4g
dGhlcmUgaXMgYSBiZXR0ZXIgaW50ZXJmYWNlIHRvIGdldCB0aGF0IHNvcnQgb2YgaW5mb3JtYXRp
b24sIGJ1dCBldmVuCj4gc28gaXQgc2hvdWxkIGJ1aWxkIG9uIGFybS4KCkknbSBub3Qgc3VyZSBp
ZiB0aGVyZSBpcyBhIGdlbmVyaWMgaW50ZXJmYWNlIGZvciB0aGlzIG9yIG5vdCwgYnV0IHRoaXMK
aXMgZm9yIFNPQyBwb3dlciBtYW5hZ2VtZW50IG9uIGFuIEFQVSwgc28gaXQncyBvbmx5IHJlbGV2
YW50IHRvIHg4Ni4KSSdsbCBzZW5kIG91dCBhIHBhdGNoIHRvIGZpeCB0aGUgYnVpbGQuCgpBbGV4
CgoKPgo+IERhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
