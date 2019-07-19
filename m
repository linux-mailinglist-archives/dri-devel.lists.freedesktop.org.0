Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B92006E18D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA4C6E5B3;
	Fri, 19 Jul 2019 07:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE786E484;
 Fri, 19 Jul 2019 03:16:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 31so30761125wrm.1;
 Thu, 18 Jul 2019 20:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3MR4MLuXempgg9+XY38m1M8XagzI4pOkSRouisWIAwU=;
 b=VbdrwslLB3ZN3YOGruTsgfWlimuqcljXnneNJP12+XFXRsVQipt0W0TZLoD9ahwiFY
 /KXqtc6cucWFx5cMoNcmCnJl7HHInqRsETpwX2dAojCS1XqeKuG9YwaHol6k0Jg5v+rB
 aA5LCFEIvE2WiRu/yJUJSVggvHFyDQfSFauMLHEb1pmQ2JB0DtG1HKTcbgVsI/WpHKgi
 Qln5oZ1QEynMOJbJTy7xUZMtfB3Uj0w1LmriPpPeRctUNJSevn1A3BwjSCSaIFMoXB+A
 +9ES53D4ZYxuIX8MyhQ69TgGOCCPiwlR4O529Oktv5LtxDnYr+wcWyOnprPbigvHCxXH
 8fKw==
X-Gm-Message-State: APjAAAU7uRUWQKWRUe95XJuuJf2eF9sc8tcHywDFi3DkIykHLeTQMrVb
 qMu+/qZUHKQIWktPBAnbhMk=
X-Google-Smtp-Source: APXvYqyKrJIFz1csxLUdaV88Iz1NIglBx65x891kgSb7B3wVhKVAwGwzhulfVHmiQu5mUksbDOuoPA==
X-Received: by 2002:adf:fc52:: with SMTP id e18mr50692871wrs.14.1563506210397; 
 Thu, 18 Jul 2019 20:16:50 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id o7sm24911614wmc.36.2019.07.18.20.16.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 20:16:49 -0700 (PDT)
Date: Thu, 18 Jul 2019 20:16:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Message-ID: <20190719031647.GA84028@archlinux-threadripper>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-6-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704055217.45860-6-natechancellor@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3MR4MLuXempgg9+XY38m1M8XagzI4pOkSRouisWIAwU=;
 b=TF1phmmlRr0DVid2bBr9bteJ34YiIud6lW4widI7y1Mji7POmzEXWMwYqwtoErMOBG
 3EAT/W8RVNeWBUDivec7SsX1Z6hMYXDcPIiiDJE3E/u0cnOBQJLFfICBh0jJupi7J7NI
 edRC9fEmbN2DD4FF4OCOBvUbjrChMbZJYh2MEZS0HCpwnMQr0Pc9WurBrB09KdEDGxSB
 EXsKstdjCMaVx+PTjibGvvVKfCo999S/cezfSIlZZVx8oPzrO/sEJ09TgWFgtckLVtpx
 O7cuHN5POAECjJGfNqdBqnMqiohUzMvpBvzQ6JkxAV23fvkGp8bXu82x/doTWtmki6Fa
 D/2g==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTA6NTI6MTZQTSAtMDcwMCwgTmF0aGFuIENoYW5jZWxs
b3Igd3JvdGU6Cj4gY2xhbmcgd2FybnM6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjMzNjo4Ogo+IHdhcm5pbmc6
IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtf
dHlwZScKPiB0byBkaWZmZXJlbnQgZW51bWVyYXRpb24gdHlwZSAnZW51bSBhbWRfcHBfY2xvY2tf
dHlwZScKPiBbLVdlbnVtLWNvbnZlcnNpb25dCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRjX3RvX3NtdV9jbG9ja190eXBlKGNsa190eXBlKSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9wcF9zbXUuYzo0MjE6MTQ6Cj4gd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBm
cm9tIGVudW1lcmF0aW9uIHR5cGUgJ2VudW0KPiBhbWRfcHBfY2xvY2tfdHlwZScgdG8gZGlmZmVy
ZW50IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gc211X2Nsa190eXBlJwo+IFstV2VudW0tY29udmVy
c2lvbl0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGNfdG9fcHBf
Y2xvY2tfdHlwZShjbGtfdHlwZSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IFRoZXJlIGFyZSBmdW5j
dGlvbnMgdG8gcHJvcGVybHkgY29udmVydCBiZXR3ZWVuIGFsbCBvZiB0aGVzZSB0eXBlcywgdXNl
Cj4gdGhlbSBzbyB0aGVyZSBhcmUgbm8gbG9uZ2VyIGFueSB3YXJuaW5ncy4KPiAKPiBGaXhlczog
YTQzOTEzZWE1MGE1ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBnZXRfY2xvY2tf
YnlfdHlwZV93aXRoX2xhdGVuY3kgZm9yIG5hdmkxMCIpCj4gRml4ZXM6IGU1ZTRlMjIzOTFjMiAo
ImRybS9hbWQvcG93ZXJwbGF5OiBhZGQgaW50ZXJmYWNlIHRvIGdldCBjbG9jayBieSB0eXBlIHdp
dGggbGF0ZW5jeSBmb3IgZGlzcGxheSAodjIpIikKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
Q2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy81ODYKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9wcF9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX3BwX3NtdS5jCj4gaW5kZXggZWFjMDliZmUzYmUyLi4wZjc2Y2ZmZjlkOWIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBf
c211LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9wcF9zbXUuYwo+IEBAIC0zMzMsNyArMzMzLDcgQEAgYm9vbCBkbV9wcF9nZXRfY2xvY2tf
bGV2ZWxzX2J5X3R5cGUoCj4gIAkJfQo+ICAJfSBlbHNlIGlmIChhZGV2LT5zbXUuZnVuY3MgJiYg
YWRldi0+c211LmZ1bmNzLT5nZXRfY2xvY2tfYnlfdHlwZSkgewo+ICAJCWlmIChzbXVfZ2V0X2Ns
b2NrX2J5X3R5cGUoJmFkZXYtPnNtdSwKPiAtCQkJCQkgIGRjX3RvX3NtdV9jbG9ja190eXBlKGNs
a190eXBlKSwKPiArCQkJCQkgIGRjX3RvX3BwX2Nsb2NrX3R5cGUoY2xrX3R5cGUpLAo+ICAJCQkJ
CSAgJnBwX2Nsa3MpKSB7Cj4gIAkJCWdldF9kZWZhdWx0X2Nsb2NrX2xldmVscyhjbGtfdHlwZSwg
ZGNfY2xrcyk7Cj4gIAkJCXJldHVybiB0cnVlOwo+IEBAIC00MTgsNyArNDE4LDcgQEAgYm9vbCBk
bV9wcF9nZXRfY2xvY2tfbGV2ZWxzX2J5X3R5cGVfd2l0aF9sYXRlbmN5KAo+ICAJCQlyZXR1cm4g
ZmFsc2U7Cj4gIAl9IGVsc2UgaWYgKGFkZXYtPnNtdS5wcHRfZnVuY3MgJiYgYWRldi0+c211LnBw
dF9mdW5jcy0+Z2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5KSB7Cj4gIAkJaWYgKHNtdV9n
ZXRfY2xvY2tfYnlfdHlwZV93aXRoX2xhdGVuY3koJmFkZXYtPnNtdSwKPiAtCQkJCQkJICAgICAg
IGRjX3RvX3BwX2Nsb2NrX3R5cGUoY2xrX3R5cGUpLAo+ICsJCQkJCQkgICAgICAgZGNfdG9fc211
X2Nsb2NrX3R5cGUoY2xrX3R5cGUpLAo+ICAJCQkJCQkgICAgICAgJnBwX2Nsa3MpKQo+ICAJCQly
ZXR1cm4gZmFsc2U7Cj4gIAl9Cj4gLS0gCj4gMi4yMi4wCj4gCgpHZW50bGUgcGluZyBmb3IgcmV2
aWV3LCB0aGlzIGlzIHRoZSBsYXN0IHJlbWFpbmluZyB3YXJuaW5nIHRoYXQgSSBzZWUKZnJvbSBh
bWRncHUgb24gbmV4dC0yMDE5MDcxOC4KCkNoZWVycywKTmF0aGFuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
