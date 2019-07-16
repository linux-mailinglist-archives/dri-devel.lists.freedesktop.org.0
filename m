Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F96AA2F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 16:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CE66E124;
	Tue, 16 Jul 2019 14:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3286E124
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:02:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so21063597wre.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 07:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oe35fzOnC1RAXt8SDWpZ6+nmzhA98yy0GhTzyA0q8fw=;
 b=q7aGKH3pLhbkXTMAYDloKLJOg2cQvtmdEHWN5NZpz+YGfNzGvCoFfxqypaUHLV4BNv
 xQrewuOY5356CboFUzuSCsvgv3AMunwNl1sIVQh9RmP+SK+/y5BfkjHDPpkbPJI8aRku
 Mo4vJMNvwSlAjYhlREj7+DtOiDhTy288B4S6JFdzqRM13rR87xINrK4wq2SiqAthcE6T
 i5OWvZmi2JddRjEe9N1qD+ar4yFJoCEZKCH0RTjcaxsBsErZ2Jp0IldnsEBCRMbMqeKo
 Xmdij3xeGwJ/I9gIlHYIOIFq4IOTYrcS5a2X/Qu5EnFEEkVv+dnib0QeDVYxts0iUTsc
 UdOA==
X-Gm-Message-State: APjAAAWkGVtro4mAfVi85WshkYOZfdE6MhfS2bnGVud34UlfIBGf/UO7
 IWsILlZuebXHXbMJFysLDl7dddwhLkD7fyV/3IY=
X-Google-Smtp-Source: APXvYqwkTY0r+v1/5X8ObpXIQbiKWYd6ztgFp97BuvrJPkBxIfD4cP2YZcn5cGAfAeG9dN03TxlqzWY4DjxYiWwWAvo=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr38218137wrn.142.1563285748896; 
 Tue, 16 Jul 2019 07:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716064220.18157-11-sam@ravnborg.org>
In-Reply-To: <20190716064220.18157-11-sam@ravnborg.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jul 2019 10:02:17 -0400
Message-ID: <CADnq5_PH_SDsqYqtwn1AjrN+b4YtDKvW++LT57tCXvfL6WG79Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/19] drm/selftests: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Oe35fzOnC1RAXt8SDWpZ6+nmzhA98yy0GhTzyA0q8fw=;
 b=TtHkIKz7Yr2pL+pSGVph5G3BVjs3W4ezivijOH1rn7B1+d45XWixZLrRhSEqXHTpcZ
 UD0WXSfEKtEL84/Ged8DsxmIXUkZela/ygWFxawd2og69YV3O89RRHNEgvSpJYRIdmM+
 XF0knMoczd0xPldJ0s2QcIhsQMaYn22sr11+GmFipL4SjFpxaGiaWtkPe57wunAtnXJm
 KJvt2LXgay/opVPyaWuzRcSM0ahIcn7gaNnv3E0HwUVCaXBKyx7upNp0uNomyaOCsuG1
 7X4KNHmJpVW6P53tCpvQpYMbqhYBr9CUjdHc5FZgEfLrDvF68A43/D2NfRQbMTHQ99eU
 RFuA==
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMjo0NSBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gRHJvcCB0aGUgc2luZ2xlIHVzZXIgb2YgZHJtUC5oIC0gcmVwbGFj
ZSBpdCB3aXRoIHJlbGV2YW50IGluY2x1ZGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IEFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVs
aWtvdkBjb2xsYWJvcmEuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogQWxleGFuZHJ1LUNv
c21pbiBHaGVvcmdoZSA8QWxleGFuZHJ1LUNvc21pbi5HaGVvcmdoZUBhcm0uY29tPgo+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXIuYyB8IDcg
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFt
ZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZl
ci5jCj4gaW5kZXggYTA0ZDAyZGFjY2UyLi43NGQ1NTYxYTg2MmIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCj4gQEAgLTMsNyAr
MywxMiBAQAo+ICAgKiBUZXN0IGNhc2VzIGZvciB0aGUgZHJtX2ZyYW1lYnVmZmVyIGZ1bmN0aW9u
cwo+ICAgKi8KPgo+IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPgo+ICsKPiArI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxk
cm0vZHJtX21vZGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+Cj4gKwo+ICAjaW5j
bHVkZSAiLi4vZHJtX2NydGNfaW50ZXJuYWwuaCIKPgo+ICAjaW5jbHVkZSAidGVzdC1kcm1fbW9k
ZXNldF9jb21tb24uaCIKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
