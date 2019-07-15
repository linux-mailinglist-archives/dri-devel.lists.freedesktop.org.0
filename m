Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01C698DE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3403089A16;
	Mon, 15 Jul 2019 16:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9A1899D4;
 Mon, 15 Jul 2019 16:09:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s15so15808981wmj.3;
 Mon, 15 Jul 2019 09:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fQPkaUZ+jePctAUjhVKB6gKSHt2QRsUl6ltTQzAvk4=;
 b=iIT5adh06EddJtDiv+MjXT+3+G1TW7pJ1t9spOBoR2ObE0fF/hlnsTgJdP9JG9TGQh
 R4JZh6at/lJoWTmAWe7MxZP2dBf9ihXL91wGHgajWN3Sk1fTkbDiW/oeRHVR6BEeuyng
 EEk3Ddg8bmAmP30Uil0gQIiSTZpOhiSgDuNd/SaFIsEPeCZCpt0onMT5LHJJCFnkTToQ
 jUYqKDkw+31QnJFe2qkpDcDe5wsHbZfx6Z2glvKkkPssmGzCJmZmSNvWKexAL0YKjcPv
 2Y/jpBhQ14qNoIiDW4+aoI4jlUL6GImrm5hgfibRlbh0R5u/D08psyWlfEiyD3oqQU1L
 Pu8Q==
X-Gm-Message-State: APjAAAUseeuzFcsPLavHJAuB97glpRfiWH5tprEsCMr0TG9jqjAH6rUQ
 NS7Dh2vgTttDjUxVM4BZcm+BoyKQJ/WJkNV5evI=
X-Google-Smtp-Source: APXvYqxs8hoWL7cmGqBiTkXz0ym5JhcT5zStF3uo6vpPbmfu9/xOFQMs+ujD5jvvM8aSCLT0Yp/V7Qwb6pVEzNIjEMg=
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr25449956wmi.141.1563206998088; 
 Mon, 15 Jul 2019 09:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190712094118.1559434-1-arnd@arndb.de>
In-Reply-To: <20190712094118.1559434-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jul 2019 12:09:45 -0400
Message-ID: <CADnq5_NX+eGdsK20_Cn_+5WDbJpyPukqhyXhgEoce4UagAncrA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: hide #warning for missing DC config
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6fQPkaUZ+jePctAUjhVKB6gKSHt2QRsUl6ltTQzAvk4=;
 b=uEOxNlokRMoceBmAqR5uFDO0QSBwIupTiHkT9Fz+VFxSksiyFFwSvd6cHOuNfFVcQ0
 eGJ8d5U4Sa1xS+gYEhzp5aM3Kg0jpp4BkPzcKyr3IY/+nB2YJ9oDHaurstQZrmsGYrgW
 ZmGm53Dta+vbqQY3wRZayyEhaPY3vfd4+CUcJ238kiPSEhprYJv1HCItJFKzOkHzZmMp
 UkaKixk16rwg+FAVT0E/KTzKOTdiKhL7YjR679c7zEo6UjekfO1oq1ceg0FUC1dm9bSQ
 TjlecO4bU+cXUBAMV8Ts7X25jGOTOWWBx3r4+6cv/NuVvamGKpzGqbLe5kgNblW/MvMZ
 Aglw==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNTo0MSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IEl0IGlzIGFubm95aW5nIHRvIGhhdmUgI3dhcm5pbmdzIHRoYXQgdHJp
Z2dlciBpbiByYW5kY29uZmlnCj4gYnVpbGRzIGxpa2UKPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmM6NjUzOjM6IGVycm9yOiAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZv
ciBkaXNwbGF5IHN1cHBvcnQgb24gU09DMTUuIgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmM6NDAwOjM6IGVycm9yOiAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5
IHN1cHBvcnQgb24gbmF2aS4iCj4KPiBSZW1vdmUgdGhlc2UgYW5kIHJlbHkgb24gdGhlIHVzZXJz
IHRvIHR1cm4gdGhlc2Ugb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMgICAgfCAyIC0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMgfCA0IC0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4gaW5kZXggOTI1M2MwM2QzODdhLi4xMGVjMGU4MWVl
NTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKPiBAQCAtMzk2LDggKzM5Niw2IEBAIGlu
dCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAjaWYgZGVm
aW5lZChDT05GSUdfRFJNX0FNRF9EQykKPiAgICAgICAgICAgICAgICAgZWxzZSBpZiAoYW1kZ3B1
X2RldmljZV9oYXNfZGNfc3VwcG9ydChhZGV2KSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBh
bWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZG1faXBfYmxvY2spOwo+IC0jZWxzZQo+
IC0jICAgICAgd2FybmluZyAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1
cHBvcnQgb24gbmF2aS4iCj4gICNlbmRpZgo+ICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNl
X2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3YxMF8wX2lwX2Jsb2NrKTsKPiAgICAgICAgICAgICAg
ICAgYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjVfMF9pcF9ibG9jayk7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCj4gaW5kZXggODcxNTJkOGVmMGRmLi45MGZi
MDE0OWZiZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiBAQCAtNjQ5LDgg
KzY0OSw2IEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQo+ICAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQykKPiAgICAgICAgICAgICAgICAg
ZWxzZSBpZiAoYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9ydChhZGV2KSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZG1faXBfYmxv
Y2spOwo+IC0jZWxzZQo+IC0jICAgICAgd2FybmluZyAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RD
IGZvciBkaXNwbGF5IHN1cHBvcnQgb24gU09DMTUuIgo+ICAjZW5kaWYKPiAgICAgICAgICAgICAg
ICAgaWYgKCEoYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTIwICYmIGFtZGdwdV9zcmlvdl92
ZihhZGV2KSkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmdXZkX3Y3XzBfaXBfYmxvY2spOwo+IEBAIC02NzEsOCArNjY5LDYgQEAg
aW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICNp
ZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQo+ICAgICAgICAgICAgICAgICBlbHNlIGlmIChh
bWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkbV9pcF9ibG9jayk7Cj4gLSNl
bHNlCj4gLSMgICAgICB3YXJuaW5nICJFbmFibGUgQ09ORklHX0RSTV9BTURfREMgZm9yIGRpc3Bs
YXkgc3VwcG9ydCBvbiBTT0MxNS4iCj4gICNlbmRpZgo+ICAgICAgICAgICAgICAgICBhbWRncHVf
ZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmNuX3YxXzBfaXBfYmxvY2spOwo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAtLQo+IDIuMjAuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
