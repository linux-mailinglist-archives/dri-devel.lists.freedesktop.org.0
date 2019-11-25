Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FCF1090D7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 16:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B872889E43;
	Mon, 25 Nov 2019 15:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E7E89E3F;
 Mon, 25 Nov 2019 15:15:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g206so15572304wme.1;
 Mon, 25 Nov 2019 07:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2e8atIpq5wHkQYzwJBKMcz9j6oQ/6fS/TGFVTRvgBmc=;
 b=hRnvV6WjysIc/ktqIYP16YRG3UeHfdUwdZ+xB2zckmL6SOSTSPoiMdpZ/UtzhS2hvf
 0e4PXRV1Xd3LZ/Zk6XyogZYEXFzPl6LdkbX/ZHC37iZKyzDFvAWveLqbRZSusduHt8Na
 DLmXIAp9JIYiHyjqOgkqQ9mxSMEN3sipM8gY/1vnvG5EgBn1cqN3/Qt8VhlAe+dBre8y
 g7RGm+HsmlHYGdyZFG+Enex0Vn4jUjDtB4LXZu3jSJ/bDEp4txVRsSoo6ODIkqVGIqAb
 Glo/kNk3Kh2qqtluUiaR6quQRObrBMrhfGT6v1KDWI25UhW+shpxIYQKz8BskQXBu9P0
 ETBA==
X-Gm-Message-State: APjAAAV70OZ5XSfl1In1+M1vrsZ6Uq6//bAxJaGHLEcZbJf65PNerUkD
 8ZYFQqTCh2oXRU/bFAw6ik/7NkdbNdvexZAZJZg=
X-Google-Smtp-Source: APXvYqxghyvx1jkPcUDgdPxir+0bmwzReEZdqf7LJpD3R7pzdk4Kx6P1GT0/XU/Wv8MHK0eSJq5KaspqeHZxqNKHHRY=
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr29227430wml.102.1574694919884; 
 Mon, 25 Nov 2019 07:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20191125145445.21648-1-yuehaibing@huawei.com>
In-Reply-To: <20191125145445.21648-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 10:15:07 -0500
Message-ID: <CADnq5_Ms09to8Pr7BedmTZ37an=bBO+6ghHQQGJZBiefctRMZA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove set but not used variable
 'msg_out'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2e8atIpq5wHkQYzwJBKMcz9j6oQ/6fS/TGFVTRvgBmc=;
 b=CDKmKl1eS0ZuvZZuyMc8GeAIR1AVwWTWWbhbNmWkxCOXYk7EX3DUQY4Ueas/nyRTYq
 OH+QK+mEravSn2lvF4wG9LIxP7wNpUuE5PgVVF4W4wZYNOPiD/jdZnWIUeTuQPUOiXTg
 sOT+okPdMyv3ed7q/+XgZUkfnDfmSCbH6uRO2LUpcqgv4wi534oAClbhEBsjbDQ/ODQA
 3DbqrlierkAZNY3vvR4Lyn4fB6do6T5/hek+pjD6DNlTZ2lKM+oVsn0lw2wlqxcmV9wA
 7TuDLLQsq+v/b46kUZexnIg3RmzCPz2m350Hn8v7wWRy2cjlqb6/9DSjvPUtFLmkrFZj
 xGOg==
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTA6MDAgQU0gWXVlSGFpYmluZyA8eXVlaGFpYmluZ0Bo
dWF3ZWkuY29tPiB3cm90ZToKPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmM6IEluIGZ1bmN0aW9uIG1vZF9oZGNwX2hkY3AyX2Vu
YWJsZV9lbmNyeXB0aW9uOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
bW9kdWxlcy9oZGNwL2hkY3BfcHNwLmM6NjMzOjc3OiB3YXJuaW5nOiB2YXJpYWJsZSBtc2dfb3V0
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYzogSW4g
ZnVuY3Rpb24gbW9kX2hkY3BfaGRjcDJfZW5hYmxlX2RwX3N0cmVhbV9lbmNyeXB0aW9uOgo+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNw
LmM6NzEwOjc3OiB3YXJuaW5nOiB2YXJpYWJsZSBtc2dfb3V0IHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBJdCBpcyBuZXZlciB1c2VkLCBzbyByZW1vdmUg
aXQuCj4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKQXBwbGllZC4g
IFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2hkY3AvaGRjcF9wc3AuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxl
cy9oZGNwL2hkY3BfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9o
ZGNwL2hkY3BfcHNwLmMKPiBpbmRleCAyZGQ1ZmVlLi40NjhmNWU2IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYwo+IEBA
IC02MzAsMTQgKzYzMCwxMiBAQCBlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2RfaGRjcF9oZGNwMl9l
bmFibGVfZW5jcnlwdGlvbihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3ApCj4gICAgICAgICBzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCA9IGhkY3AtPmNvbmZpZy5wc3AuaGFuZGxlOwo+ICAgICAgICAgc3Ry
dWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSAqaGRjcF9jbWQ7Cj4gICAgICAgICBzdHJ1Y3QgdGFf
aGRjcF9jbWRfaGRjcDJfcHJvY2Vzc19wcmVwYXJlX2F1dGhlbnRpY2F0aW9uX21lc3NhZ2VfaW5w
dXRfdjIgKm1zZ19pbjsKPiAtICAgICAgIHN0cnVjdCB0YV9oZGNwX2NtZF9oZGNwMl9wcm9jZXNz
X3ByZXBhcmVfYXV0aGVudGljYXRpb25fbWVzc2FnZV9vdXRwdXRfdjIgKm1zZ19vdXQ7Cj4gICAg
ICAgICBzdHJ1Y3QgbW9kX2hkY3BfZGlzcGxheSAqZGlzcGxheSA9IGdldF9maXJzdF9hZGRlZF9k
aXNwbGF5KGhkY3ApOwo+Cj4gICAgICAgICBoZGNwX2NtZCA9IChzdHJ1Y3QgdGFfaGRjcF9zaGFy
ZWRfbWVtb3J5ICopcHNwLT5oZGNwX2NvbnRleHQuaGRjcF9zaGFyZWRfYnVmOwo+ICAgICAgICAg
bWVtc2V0KGhkY3BfY21kLCAwLCBzaXplb2Yoc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSkp
Owo+Cj4gICAgICAgICBtc2dfaW4gPSAmaGRjcF9jbWQtPmluX21zZy5oZGNwMl9wcmVwYXJlX3By
b2Nlc3NfYXV0aGVudGljYXRpb25fbWVzc2FnZV92MjsKPiAtICAgICAgIG1zZ19vdXQgPSAmaGRj
cF9jbWQtPm91dF9tc2cuaGRjcDJfcHJlcGFyZV9wcm9jZXNzX2F1dGhlbnRpY2F0aW9uX21lc3Nh
Z2VfdjI7Cj4KPiAgICAgICAgIGhkY3AyX21lc3NhZ2VfaW5pdChoZGNwLCBtc2dfaW4pOwo+Cj4g
QEAgLTcwNywxNCArNzA1LDEyIEBAIGVudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2hkY3Ay
X2VuYWJsZV9kcF9zdHJlYW1fZW5jcnlwdGlvbihzdHJ1Y3QgbW9kX2hkY3AKPiAgICAgICAgIHN0
cnVjdCBwc3BfY29udGV4dCAqcHNwID0gaGRjcC0+Y29uZmlnLnBzcC5oYW5kbGU7Cj4gICAgICAg
ICBzdHJ1Y3QgdGFfaGRjcF9zaGFyZWRfbWVtb3J5ICpoZGNwX2NtZDsKPiAgICAgICAgIHN0cnVj
dCB0YV9oZGNwX2NtZF9oZGNwMl9wcm9jZXNzX3ByZXBhcmVfYXV0aGVudGljYXRpb25fbWVzc2Fn
ZV9pbnB1dF92MiAqbXNnX2luOwo+IC0gICAgICAgc3RydWN0IHRhX2hkY3BfY21kX2hkY3AyX3By
b2Nlc3NfcHJlcGFyZV9hdXRoZW50aWNhdGlvbl9tZXNzYWdlX291dHB1dF92MiAqbXNnX291dDsK
PiAgICAgICAgIHVpbnQ4X3QgaTsKPgo+ICAgICAgICAgaGRjcF9jbWQgPSAoc3RydWN0IHRhX2hk
Y3Bfc2hhcmVkX21lbW9yeSAqKXBzcC0+aGRjcF9jb250ZXh0LmhkY3Bfc2hhcmVkX2J1ZjsKPiAg
ICAgICAgIG1lbXNldChoZGNwX2NtZCwgMCwgc2l6ZW9mKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9t
ZW1vcnkpKTsKPgo+ICAgICAgICAgbXNnX2luID0gJmhkY3BfY21kLT5pbl9tc2cuaGRjcDJfcHJl
cGFyZV9wcm9jZXNzX2F1dGhlbnRpY2F0aW9uX21lc3NhZ2VfdjI7Cj4gLSAgICAgICBtc2dfb3V0
ID0gJmhkY3BfY21kLT5vdXRfbXNnLmhkY3AyX3ByZXBhcmVfcHJvY2Vzc19hdXRoZW50aWNhdGlv
bl9tZXNzYWdlX3YyOwo+Cj4gICAgICAgICBoZGNwMl9tZXNzYWdlX2luaXQoaGRjcCwgbXNnX2lu
KTsKPgo+IC0tCj4gMi43LjQKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
