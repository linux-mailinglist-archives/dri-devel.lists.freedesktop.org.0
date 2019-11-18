Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB53100A30
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923E6E788;
	Mon, 18 Nov 2019 17:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E696E788;
 Mon, 18 Nov 2019 17:26:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b17so148472wmj.2;
 Mon, 18 Nov 2019 09:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGZRKZVE6R/ctZX3yvkKSU5A1TDLcZlFZYcsoliX7ag=;
 b=X/C3asTxIkRDOrE6XrviR+IfxJNM9Bpr9FJTPkZtwNsM6vIzx+5WPazqlNY2b+k9Ux
 m7hZ9jlrpxmuX+kAFmwcPjMdfD3BOc+ZFQMuxh+VPmUMw+iqn1uOtWYzibhIW6yW3FtA
 QGXYLIdwjqHcXtz2FlGHZibkfntjrviwBPGETwK6zInabz3Cz21eyuLeriWPFbiAXB8H
 kCfzhdsANzRYJXCnoEfTuuTyqzu/HTIQ7l/u6Mdu1GgXTuD13uBsw6WiiXa8sQ/BKHFL
 2YCnmqkmSzms/UAH5NEFgKAiBZXqKz4NwhPSnCCZv8FP1YKadySy97HYxS7TobPlF7ne
 OKbw==
X-Gm-Message-State: APjAAAUu8okC1pQHD3W/vp8nGdIyN119joKNYJlAo62vu4JSCbjtCMA2
 01f3lj6Xy5gznTzjkQGjlaaHlL492mNAN1zBmyo=
X-Google-Smtp-Source: APXvYqwd7IKmDBJKW52BeNXeWynO3slu02LsD5U9yICH9dAZqtu/ParPSgyu+VW8E3CKno03hKLNa4G+IG6NA8hydAE=
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr184141wma.34.1574097983469; 
 Mon, 18 Nov 2019 09:26:23 -0800 (PST)
MIME-Version: 1.0
References: <1574067631-26219-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1574067631-26219-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2019 12:26:10 -0500
Message-ID: <CADnq5_P981Pt7643HvJQSV_nLqtbEQjO4=cXQDYkUF8ikNeNcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove not needed memset
To: zhengbin <zhengbin13@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PGZRKZVE6R/ctZX3yvkKSU5A1TDLcZlFZYcsoliX7ag=;
 b=bPx0x0OVj5AxowVEX7hXpD63dhhM3JKTEUdpzzSmd23z/KRVYQ0tRJ1Nxv8FvZd5Rc
 A2sqEDXXo8f8JuMzvmaHHIpyozvxlgYupGY53iEV8Q2U6ScUFF+uK1BwKf0I3S1ywz+x
 ch3K1UkJLmk8rSQlCs5YaqB8nfUt8yZaqm7F41jWj4Ddd38v9KNYidTJ8rKiP/iKFGZv
 BLhDe2dz2l+JDiXe2GyBkX3qDS2ymiPOlAC74tkjvQLifRgBznpCuf+lIg8oIvPfag4A
 g716oerf3EcwA6+jk1WtTmMW5fmbIZlTudT71uCXa/KefFEt5m+W2UfzT+Oz8/LgxPhK
 29Yw==
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDEwOjA3IEFN
IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gRml4ZXMgY29jY2lj
aGVjayB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmM6
NjQ6MTMtMzE6IFdBUk5JTkc6IGRtYV9hbGxvY19jb2hlcmVudCB1c2UgaW4gaWggLT4gcmluZyBh
bHJlYWR5IHplcm9lcyBvdXQgbWVtb3J5LCAgc28gbWVtc2V0IGlzIG5vdCBuZWVkZWQKPgo+IFJl
cG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWguYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMKPiBpbmRleCA2
ZDhmMDU1Li4xMTFhMzAxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9paC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lo
LmMKPiBAQCAtNjYsNyArNjYsNiBAQCBpbnQgYW1kZ3B1X2loX3JpbmdfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9paF9yaW5nICppaCwKPiAgICAgICAgICAg
ICAgICAgaWYgKGloLT5yaW5nID09IE5VTEwpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07Cj4KPiAtICAgICAgICAgICAgICAgbWVtc2V0KCh2b2lkICopaWgtPnJpbmcs
IDAsIGloLT5yaW5nX3NpemUgKyA4KTsKPiAgICAgICAgICAgICAgICAgaWgtPmdwdV9hZGRyID0g
ZG1hX2FkZHI7Cj4gICAgICAgICAgICAgICAgIGloLT53cHRyX2FkZHIgPSBkbWFfYWRkciArIGlo
LT5yaW5nX3NpemU7Cj4gICAgICAgICAgICAgICAgIGloLT53cHRyX2NwdSA9ICZpaC0+cmluZ1tp
aC0+cmluZ19zaXplIC8gNF07Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
