Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E459418C58
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 16:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693EA89B65;
	Thu,  9 May 2019 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107B589B65;
 Thu,  9 May 2019 14:51:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o4so3483268wra.3;
 Thu, 09 May 2019 07:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NnIVSTbXkxS0yhKtK5Xl2+rccguXdwwJsXkxd/ssJco=;
 b=dW4wMTHGanTNktG1wiHoO1BC1zroDbQhovfEgJVDqkouek4dLz0tHvsoSEYGxz5GoP
 1bWSGHcdhy2orY+s5lt0HsxqUQVtQfZlhXjfgSCDAe3DV2o741lKJiK7oxjiqaDLkYTX
 lBK0qO+uFncQ2/asjAgOqDgE7uRt4TBUjVtQwS+6Pd6wZMRShiGRIi9QOhUhMvwa18I4
 tRMradEbT2ZA86J3w/adPsliVySWOjNAPW/+LeUl+gTN+2C9WqT8kLuov6eIXNI1eoHb
 R4cKnV+Sd/uRjepZJj578Tlpm3tGzR8UFPmc9E4yLBzW1Q8d/DrSnVbgixVnKDe24wLN
 BzYg==
X-Gm-Message-State: APjAAAWco+B+cBPegfnnDlbAEh9YQlhJQ4iDItNQmvj7y1q6UAnNI5Xo
 8UrYpbH1jwFqg7M4VMG3WWCgJIixDPK14J55dtA=
X-Google-Smtp-Source: APXvYqyw6AVan6W+w1LMEkfKYRd7eqcaBqO4NEiGhzTMOQ4FZpcP8d/2DdivQSG357GbKZTLP20eNWPdroaESd+DEno=
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr3401996wrq.317.1557413508636; 
 Thu, 09 May 2019 07:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190508125516.16732-1-wanghai26@huawei.com>
In-Reply-To: <20190508125516.16732-1-wanghai26@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2019 10:51:36 -0400
Message-ID: <CADnq5_NmbWQWjYe5DnGJAPh-uA6Fwi+xZ4FJq-tJWYDuXp6teg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Make some functions static
To: Wang Hai <wanghai26@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NnIVSTbXkxS0yhKtK5Xl2+rccguXdwwJsXkxd/ssJco=;
 b=gxZh6+94YVMwo9tSjmQcnBR5/SHN/gMgGTviBNlpNv8ZSYHK6QRWULthr4xYwlzSkO
 i414W6PFW9Lhca7FNfRjJ4Lq8LaXbeOuHiFNdpkZwRzRDvorreq1lhUdvwZkD9Fk3Mze
 cWQhYZ7OGmivg9v+eOEHtTXxmzxuKJXmCSQDGc91mOX6i7DM2wtbpEThOXPc+OCSapt+
 mtQOhu87HRGuH9CLBh6LFi+cecMnGgRArya4MmFXuUNIeZckQNDqQWaS1JSKBA/NnyzR
 rTImp4xFd0zWOe7j4lCwL/60O7jgMp52Cgi5dTvfMAq6SY1P50CqFX18H51pjeB89XVT
 RtEQ==
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
 David Francis <David.Francis@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, Jerry Zuo <Jerry.Zuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun.Lei@amd.com,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgOCwgMjAxOSBhdCAxMDo0NyBBTSBXYW5nIEhhaSA8d2FuZ2hhaTI2QGh1YXdl
aS5jb20+IHdyb3RlOgo+Cj4gRml4IHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmdzOgo+Cj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jl
c291cmNlLmM6NDgzOjIxOiB3YXJuaW5nOiBzeW1ib2wgJ2RjZTEyMF9jbG9ja19zb3VyY2VfY3Jl
YXRlJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjUw
Njo2OiB3YXJuaW5nOiBzeW1ib2wgJ2RjZTEyMF9jbG9ja19zb3VyY2VfZGVzdHJveScgd2FzIG5v
dCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzo1MTM6Njogd2Fybmlu
Zzogc3ltYm9sICdkY2UxMjBfaHdfc2VxdWVuY2VyX2NyZWF0ZScgd2FzIG5vdCBkZWNsYXJlZC4g
U2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IEZpeGVzOiBiOGZkZmNjNmE5MmMgKCJkcm0vYW1kL2Rp
c3BsYXk6IEFkZCBEQ0UxMiBjb3JlIHN1cHBvcnQiKQo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90
IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIEhhaSA8d2FuZ2hhaTI2
QGh1YXdlaS5jb20+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYyB8IDYgKysrLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBf
cmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIw
X3Jlc291cmNlLmMKPiBpbmRleCAzMTJhMGFlYmY5MWYuLjA5NDg0MjEyMTllZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJj
ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBf
cmVzb3VyY2UuYwo+IEBAIC00NTgsNyArNDU4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY19k
ZWJ1Z19vcHRpb25zIGRlYnVnX2RlZmF1bHRzID0gewo+ICAgICAgICAgICAgICAgICAuZGlzYWJs
ZV9jbG9ja19nYXRlID0gdHJ1ZSwKPiAgfTsKPgo+IC1zdHJ1Y3QgY2xvY2tfc291cmNlICpkY2Ux
MjBfY2xvY2tfc291cmNlX2NyZWF0ZSgKPiArc3RhdGljIHN0cnVjdCBjbG9ja19zb3VyY2UgKmRj
ZTEyMF9jbG9ja19zb3VyY2VfY3JlYXRlKAo+ICAgICAgICAgc3RydWN0IGRjX2NvbnRleHQgKmN0
eCwKPiAgICAgICAgIHN0cnVjdCBkY19iaW9zICpiaW9zLAo+ICAgICAgICAgZW51bSBjbG9ja19z
b3VyY2VfaWQgaWQsCj4gQEAgLTQ4MSwxNCArNDgxLDE0IEBAIHN0cnVjdCBjbG9ja19zb3VyY2Ug
KmRjZTEyMF9jbG9ja19zb3VyY2VfY3JlYXRlKAo+ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gIH0K
Pgo+IC12b2lkIGRjZTEyMF9jbG9ja19zb3VyY2VfZGVzdHJveShzdHJ1Y3QgY2xvY2tfc291cmNl
ICoqY2xrX3NyYykKPiArc3RhdGljIHZvaWQgZGNlMTIwX2Nsb2NrX3NvdXJjZV9kZXN0cm95KHN0
cnVjdCBjbG9ja19zb3VyY2UgKipjbGtfc3JjKQo+ICB7Cj4gICAgICAgICBrZnJlZShUT19EQ0Ux
MTBfQ0xLX1NSQygqY2xrX3NyYykpOwo+ICAgICAgICAgKmNsa19zcmMgPSBOVUxMOwo+ICB9Cj4K
Pgo+IC1ib29sIGRjZTEyMF9od19zZXF1ZW5jZXJfY3JlYXRlKHN0cnVjdCBkYyAqZGMpCj4gK3N0
YXRpYyBib29sIGRjZTEyMF9od19zZXF1ZW5jZXJfY3JlYXRlKHN0cnVjdCBkYyAqZGMpCj4gIHsK
PiAgICAgICAgIC8qIEFsbCByZWdpc3RlcnMgdXNlZCBieSBkY2UxMS4yIG1hdGNoIHRob3NlIGlu
IGRjZTExIGluIG9mZnNldCBhbmQKPiAgICAgICAgICAqIHN0cnVjdHVyZQo+IC0tCj4gMi4xNy4x
Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
