Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B134F93
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 20:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667E289B97;
	Tue,  4 Jun 2019 18:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13DA89B84
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 18:07:36 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x47so14828260qtk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 11:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=73fBt14f3pUCJec+S60pIUDJLnv+MtJaME4OItITl6A=;
 b=B9RV2ftCoN+BGsbp3Hm/Zs+CisPffqdvVtLAtMdaBYcfIURCAtuHb5mflA+1x33Ocj
 A0s7oKurj1b8wG69gTfSrqz+3dXzFGVCfrIfv8PI3wjIUOP1QTMW1/yMopjxpAF75Be+
 Qt6lxFP73veWkhDQUIS8x1Yol2A10aSJDRc45k1tHHdINsL8Y9tVyMipTdP5LqzXJnSI
 ijvXkGRqurmlIaW6X95GYSI98/lfsXsJM4sKKy6c65cMzZ+gLIwPv0kfVzDktnEFHwaH
 IV14I2oT71Ns6xqC+Ju8DigGKwYGK03XH+odzQyk6//6K21zNbb/IwjkAzjfygRvDdqH
 572g==
X-Gm-Message-State: APjAAAXbf//v8JBiUP36NM4T2Iawpoj0hdk5oVxvHDmWf1qF6+ZQbikY
 pEF6LfU+l5aTLm8iaAKREzZ05A==
X-Google-Smtp-Source: APXvYqyxgf1WmSBazer4xd3OsrXTZLsp3jGSP0eU0YMEKNXF2LEaE0JS9J1WAW9vN/UrYUOkS2RmQw==
X-Received: by 2002:ac8:2b10:: with SMTP id 16mr11593422qtu.351.1559671655999; 
 Tue, 04 Jun 2019 11:07:35 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id q29sm342103qkq.77.2019.06.04.11.07.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 04 Jun 2019 11:07:35 -0700 (PDT)
Message-ID: <47b602c0a07ad5e945ab4bc706b2bf3154ea3196.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios: downgrade absence of tmds table to
 info from an error
From: Lyude Paul <lyude@redhat.com>
To: Rhys Kidd <rhyskidd@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Ilia
 Mirkin <imirkin@alum.mit.edu>
Date: Tue, 04 Jun 2019 14:07:33 -0400
In-Reply-To: <20190602120727.4001-1-rhyskidd@gmail.com>
References: <20190602120727.4001-1-rhyskidd@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBTdW4sIDIwMTkt
MDYtMDIgYXQgMjI6MDcgKzEwMDAsIFJoeXMgS2lkZCB3cm90ZToKPiBBYnNlbmNlIG9mIGEgVE1E
UyBJbmZvIFRhYmxlIGlzIGNvbW1vbiBvbiBPcHRpbXVzIHNldHVwcyB3aGVyZSB0aGUgTlZJRElB
Cj4gZ3B1IGlzIG5vdCBjb25uZWN0ZWQgZGlyZWN0bHkgdG8gYW55IG91dHB1dHMuCj4gCj4gUmVw
b3J0aW5nIGFuIGVycm9yIGluIHRoaXMgc2NlbmFyaW8gaXMgdG9vIGhhcnNoLiBBY2NvcmRpbmds
eSwgY2hhbmdlIHRoZQo+IGVycm9yIG1lc3NhZ2UgdG8gYW4gaW5mbyBtZXNzYWdlLgo+IAo+IEJ5
IGRlZmF1bHQgdGhlIGVycm9yIG1lc3NhZ2UgYWxzbyBjYXVzZXMgYSBib290IGZsaWNrZXIgZm9y
IHRoZXNlIHN5dGVtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaHlzIEtpZGQgPHJoeXNraWRkQGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3MuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmMKPiBpbmRleCA2NmJmMmFm
ZjRhM2UuLmJkZmFkYzYzMjA0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Jpb3MuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ymlvcy5jCj4gQEAgLTkzNSw3ICs5MzUsNyBAQCBzdGF0aWMgaW50IHBhcnNlX2JpdF90bWRzX3Ri
bF9lbnRyeShzdHJ1Y3QgZHJtX2RldmljZQo+ICpkZXYsIHN0cnVjdCBudmJpb3MgKmJpb3MsCj4g
IAo+ICAJdG1kc3RhYmxlcHRyID0gUk9NMTYoYmlvcy0+ZGF0YVtiaXRlbnRyeS0+b2Zmc2V0XSk7
Cj4gIAlpZiAoIXRtZHN0YWJsZXB0cikgewo+IC0JCU5WX0VSUk9SKGRybSwgIlBvaW50ZXIgdG8g
VE1EUyB0YWJsZSBpbnZhbGlkXG4iKTsKPiArCQlOVl9JTkZPKGRybSwgIlBvaW50ZXIgdG8gVE1E
UyB0YWJsZSBub3QgZm91bmRcbiIpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKLS0g
CkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
