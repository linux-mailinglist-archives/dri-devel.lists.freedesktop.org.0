Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F97E546D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F18B6EB82;
	Fri, 25 Oct 2019 19:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091826EB7B;
 Fri, 25 Oct 2019 19:36:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so3617527wrm.8;
 Fri, 25 Oct 2019 12:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKgsFbx8Ep6iOXlXatCgfl2QJqYHidBhx0D+NEJMyLo=;
 b=RRhuzKI8c4U1p+tdQFWcguF/6qY4TK7fPkqRCJzzF0phVPVkm7DGkg+rYS1K2vnN7o
 Ih/Ad2rU46+GfAyLfOYwMTGd39IKE/XgTmGQbpf//yixfPlhOGp/k9CHHu6l4WBva12J
 BhiZpxc1W4qt5yUR0SfcOgJA96YU6xseTcpRWifTTtrCn9jLZuvzA3c9vqtqS04mOpw7
 sIgDUGaokvU61221wxS+Nqn+cHfXkBDrtvHdteAzIR8N8T3/AsOCOIaOThp05jQk4/zh
 sNtVqpPksyIrmUSF1TyZf3SwC70Z5W+g+cmW9/cjfi266MqvS1XDwRC1kz+FOcGULjZf
 2TPA==
X-Gm-Message-State: APjAAAVPw9ttrbcuZZQElvoDDWV6+xZM0KW5qQTlHcyrtVrha6aOJaHD
 7/w1r11z2IIws9X6rgJ6FrB0rIUS/Z5ibE5IXZQ=
X-Google-Smtp-Source: APXvYqwMDwW4AyIxm3bcNrPMq1dwCxnVICIYRR/Y5+vKCesA43Yg/x9R3k2Irdc3Pwz6VVvg8ChPIZGNsdg/LFMO7nw=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr4661857wrw.206.1572032195543; 
 Fri, 25 Oct 2019 12:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191019073242.21652-1-wambui@karuga.xyz>
 <2bed3fab-e84d-226d-b552-1ac088fc5d9c@amd.com>
In-Reply-To: <2bed3fab-e84d-226d-b552-1ac088fc5d9c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Oct 2019 15:36:23 -0400
Message-ID: <CADnq5_PeCmE-rmUaVDXtLNi20aMzYkeoLUtxHr9yT7P0Nix+qw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove assignment for return value
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vKgsFbx8Ep6iOXlXatCgfl2QJqYHidBhx0D+NEJMyLo=;
 b=OYW0esZZ6B8EKsDTY2vGfRPRy99SJ3ZPr9FUu3Pu00ygV96AVxKm2XvVThu2GBAKBE
 IP8FqmojtSAn97B4Lnko6Vl/CndCsFkjQRCZk0Qxwx9aYtaPvvzHsKjf1zUQjW0VfNR/
 WtSXgiVb0XdlwJ/9mBbEY/qE/44PoZJUbuVFtiHJjj/PSHL4+SSu77q6wDgeS91MArDg
 CFKAaEIYWSsWWAjy1u4icShmr+I5DJekVSuWShrkT7XD0obab0nMc9O4eML32tB31tqm
 ebfh++CM8OfUbK+c4gTIw2SnurUjVhfdzazZWgqY7dIsctZ870wOjpFN4wqwrhNzpQnM
 5eXQ==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Wambui Karuga <wambui@karuga.xyz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "outreachy-kernel@googlegroups.com" <outreachy-kernel@googlegroups.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDExOjA5IEFN
IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPiB3cm90ZToKPgo+IE9uIDIwMTktMTAt
MTkgMzozMiBhLm0uLCBXYW1idWkgS2FydWdhIHdyb3RlOgo+ID4gUmVtb3ZlIHVubmVjZXNzYXJ5
IGFzc2lnbm1lbnQgZm9yIHJldHVybiB2YWx1ZSBhbmQgaGF2ZSB0aGUKPiA+IGZ1bmN0aW9uIHJl
dHVybiB0aGUgcmVxdWlyZWQgdmFsdWUgZGlyZWN0bHkuCj4gPiBJc3N1ZSBmb3VuZCBieSBjb2Nj
aW5lbGxlOgo+ID4gQEAKPiA+IGxvY2FsIGlkZXhwcmVzc2lvbiByZXQ7Cj4gPiBleHByZXNzaW9u
IGU7Cj4gPiBAQAo+ID4KPiA+IC1yZXQgPQo+ID4gK3JldHVybgo+ID4gICAgICBlOwo+ID4gLXJl
dHVybiByZXQ7Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpQGth
cnVnYS54eXo+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guCj4KPiBSZXZpZXdlZC1ieTogSGFy
cnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4KPiBIYXJyeQo+Cj4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgfCA4ICsrLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vY2lrLmMKPiA+IGluZGV4IDYyZWFiODJhNjRmOS4uZGFmZjlhMmFmM2JlIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jaWsuYwo+ID4gQEAgLTIyMSw5ICsyMjEsNyBAQCBpbnQgY2lfZ2V0X3Rl
bXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gPiAgICAgICBlbHNlCj4gPiAgICAgICAg
ICAgICAgIGFjdHVhbF90ZW1wID0gdGVtcCAmIDB4MWZmOwo+ID4KPiA+IC0gICAgIGFjdHVhbF90
ZW1wID0gYWN0dWFsX3RlbXAgKiAxMDAwOwo+ID4gLQo+ID4gLSAgICAgcmV0dXJuIGFjdHVhbF90
ZW1wOwo+ID4gKyAgICAgcmV0dXJuIGFjdHVhbF90ZW1wICogMTAwMDsKPiA+ICB9Cj4gPgo+ID4g
IC8qIGdldCB0ZW1wZXJhdHVyZSBpbiBtaWxsaWRlZ3JlZXMgKi8KPiA+IEBAIC0yMzksOSArMjM3
LDcgQEAgaW50IGt2X2dldF90ZW1wKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ID4gICAg
ICAgZWxzZQo+ID4gICAgICAgICAgICAgICBhY3R1YWxfdGVtcCA9IDA7Cj4gPgo+ID4gLSAgICAg
YWN0dWFsX3RlbXAgPSBhY3R1YWxfdGVtcCAqIDEwMDA7Cj4gPiAtCj4gPiAtICAgICByZXR1cm4g
YWN0dWFsX3RlbXA7Cj4gPiArICAgICByZXR1cm4gYWN0dWFsX3RlbXAgKiAxMDAwOwo+ID4gIH0K
PiA+Cj4gPiAgLyoKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
